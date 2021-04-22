


//https://api.secedo-unap.com/api/Cuotas/9808





import 'dart:convert';
  
import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/database/cuotas_prestamos_database.dart';
import 'package:secedo_unap/src/model/cuotas_prestamos_model.dart';
import 'package:secedo_unap/src/utils/constants.dart'; 
 

class CuotasPrestamosApi { 
  final cuotasPrestamosDatabase = CuotasPrestamosDatabase();

  Future<bool> obtenerCuotasPrestamos(String idPrestamo) async {
    try {

      //id es el id del usuario
      final url = Uri.parse('$apiBaseURL/api/Cuotas/$idPrestamo');

      final resp = await http.get(url);//(url, body: {'id_empresa': id, 'app': 'true', 'tn': prefs.token});

      final decodedData = json.decode(resp.body);

      if (decodedData.length > 0) {
        for (int i = 0; i < decodedData.length; i++) {
          CuotasPrestamosModel cuotasPrestamosModel = CuotasPrestamosModel();

          String posicion = (i+1).toString();
          String idPrestamo = decodedData[i]['id_prestamo'].toString();

          cuotasPrestamosModel.idCuota = decodedData[i]['id_cuotas_de_prestamo'].toString();
          cuotasPrestamosModel.vencimiento = decodedData[i]['Vencimiento'].toString();
          cuotasPrestamosModel.monto = decodedData[i]['Monto'].toString();
          cuotasPrestamosModel.fpago = decodedData[i]['Fecha_de_pago'].toString();
          cuotasPrestamosModel.pagado = decodedData[i]['Pagado'].toString();
          cuotasPrestamosModel.principal = decodedData[i]['Principal'].toString();
          cuotasPrestamosModel.cuota = decodedData[i]['Cuota'].toString();
          cuotasPrestamosModel.interes = decodedData[i]['Interes'].toString();
          cuotasPrestamosModel.idPrestamo = idPrestamo;
          cuotasPrestamosModel.posicion = posicion;
          cuotasPrestamosModel.estadoPagado = (decodedData[i]['Pagado']!=null)?'1':'0';

          await cuotasPrestamosDatabase.insertarCuotasPrestamos(cuotasPrestamosModel);
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