




import 'dart:convert';
  
import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/api/cuotas_prestamo_api.dart';
import 'package:secedo_unap/src/database/prestamos_database.dart';
import 'package:secedo_unap/src/model/prestamos_model.dart';
import 'package:secedo_unap/src/utils/constants.dart'; 
 

class PrestamosApi { 
  final prestamosDatabase = PrestamosDatabase();
  final cuotasPrestamosApi = CuotasPrestamosApi();

  Future<bool> obtenerPrestamos(String idUsuario) async {
    try {

      //id es el id del usuario
      final url = Uri.parse('$apiBaseURL/api/Prestamoes/$idUsuario');

      final resp = await http.get(url);//(url, body: {'id_empresa': id, 'app': 'true', 'tn': prefs.token});

      final decodedData = json.decode(resp.body);

      if (decodedData.length > 0) {
        for (int i = 0; i < decodedData.length; i++) {
          PrestamosModel prestamosModel = PrestamosModel();

          prestamosModel.idPrestamo = decodedData[i]['id_prestamo'].toString();
          prestamosModel.cheque = decodedData[i]['Cheque'].toString();
          prestamosModel.fSolicitud = decodedData[i]['F_solicitud'].toString();
          prestamosModel.solicitado = decodedData[i]['Solicitado'].toString();
          prestamosModel.fAprobado = decodedData[i]['F_aprobado'].toString();
          prestamosModel.aprobado = decodedData[i]['Aprobado'].toString();
          prestamosModel.girar = decodedData[i]['Girar'].toString();
          prestamosModel.tInteres = decodedData[i]['T_interes'].toString();
          prestamosModel.nCuotas = decodedData[i]['N__Cuotas'].toString();
          prestamosModel.tipo = decodedData[i]['Tipo'].toString();
          prestamosModel.prioridad = decodedData[i]['Prioridad'].toString();
          prestamosModel.garante = decodedData[i]['Garante'].toString();
          prestamosModel.idPersona = decodedData[i]['id_persona'].toString();

          await prestamosDatabase.insertarPrestamos(prestamosModel);


          await cuotasPrestamosApi.obtenerCuotasPrestamos(prestamosModel.idPrestamo);
        }

        return true;
      } else {
        return false;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }
}