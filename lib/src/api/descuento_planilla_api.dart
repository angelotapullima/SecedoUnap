











import 'dart:convert';
  
import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/database/descuento_planilla_database.dart';
import 'package:secedo_unap/src/model/descuento_planilla_model.dart';
import 'package:secedo_unap/src/utils/constants.dart'; 
 

class DescuentoPlanillaApi { 
  final descuentoPlanillaDatabase = DescuentoPlanillaDatabase();

  Future<bool> obtenerDescuentoPlanilla() async {
    try {

      //id es el id del usuario
      final url = Uri.parse('$apiBaseURL/api/Descuento_planilla/$idUsuario');

      final resp = await http.get(url);//(url, body: {'id_empresa': id, 'app': 'true', 'tn': prefs.token});

      final decodedData = json.decode(resp.body);

      if (decodedData.length > 0) {

        await descuentoPlanillaDatabase.deleteDescuentoPlanilla();
        for (int i = 0; i < decodedData.length; i++) {

          String fecha;
          var fechaServidor = decodedData[i]['fecha'];
          fechaServidor = fechaServidor.split('T');
          fecha = fechaServidor[0].trim();

          DescuentoPlanillaModel descuentoPlanillaModel = DescuentoPlanillaModel();

          descuentoPlanillaModel.idDescuentoPlanilla = decodedData[i]['id_descuento_planilla'].toString();
          descuentoPlanillaModel.idAfiliacion = decodedData[i]['id_afiliacion'].toString();
          descuentoPlanillaModel.codigo = decodedData[i]['Codigo'].toString();
          descuentoPlanillaModel.nombre = decodedData[i]['Nombre'].toString();
          descuentoPlanillaModel.fecha = fecha;
          descuentoPlanillaModel.cesantia = decodedData[i]['cesantia'].toString();
          descuentoPlanillaModel.funeral = decodedData[i]['funeral'].toString();
          descuentoPlanillaModel.jubilacion = decodedData[i]['jubilacion'].toString();
          descuentoPlanillaModel.otros = decodedData[i]['otros'].toString();
          descuentoPlanillaModel.multa = decodedData[i]['multa'].toString();
          descuentoPlanillaModel.apr = decodedData[i]['apr'].toString();
          descuentoPlanillaModel.garantizado = decodedData[i]['garantizado'].toString();
          descuentoPlanillaModel.descuento = decodedData[i]['descuento'].toString();
          descuentoPlanillaModel.ntotal = decodedData[i]['ntotal'].toString();
          descuentoPlanillaModel.aplicado = decodedData[i]['aplicado'].toString();
          descuentoPlanillaModel.diferencia = decodedData[i]['Direrencia'].toString();
          descuentoPlanillaModel.idPersona = decodedData[i]['id_persona'].toString();
          descuentoPlanillaModel.posicion = (i+1).toString();

          await descuentoPlanillaDatabase.insertarDescuentosPlanillas(descuentoPlanillaModel);


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