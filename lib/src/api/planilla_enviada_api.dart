



















import 'dart:convert';
  
import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/database/planilla_enviada_database.dart';
import 'package:secedo_unap/src/model/planilla_enviada_model.dart';

import 'package:secedo_unap/src/utils/constants.dart'; 
 

class PlanillaEnviadaApi { 
  final planillaEnviadaDatabase = PlanillaEnviadaDatabase();

  Future<bool> obtenerPlanillaEnviada() async {
    try {

      //id es el id del usuario
      final url = Uri.parse('$apiBaseURL/api/Planilla_enviada/$idAfiliacion');

      final resp = await http.get(url);//(url, body: {'id_empresa': id, 'app': 'true', 'tn': prefs.token});

      final decodedData = json.decode(resp.body);

      if (decodedData.length > 0) {

        await planillaEnviadaDatabase.deletePlanillaEnviada();
        for (int i = 0; i < decodedData.length; i++) {

          String fecha;
          var fechaServidor = decodedData[i]['fecha'];
          fechaServidor = fechaServidor.split('T');
          fecha = fechaServidor[0].trim();

          PlanillaEnviadaModel planillaEnviadaModel = PlanillaEnviadaModel();

          planillaEnviadaModel.idPlanillaEnviada = decodedData[i]['id_planilla_enviada'].toString();
          planillaEnviadaModel.idAfiliacion = decodedData[i]['id_afiliacion'].toString();
          planillaEnviadaModel.tipoPlanilla = decodedData[i]['tipo_planilla'].toString();
          planillaEnviadaModel.fecha = fecha;
          planillaEnviadaModel.cesantia = decodedData[i]['cesantia'].toString();
          planillaEnviadaModel.funeral = decodedData[i]['funeral'].toString();
          planillaEnviadaModel.jubilacion = decodedData[i]['jubilacion'].toString();
          planillaEnviadaModel.multa = decodedData[i]['multa'].toString();
          planillaEnviadaModel.apr = decodedData[i]['apr'].toString();
          planillaEnviadaModel.garantizado = decodedData[i]['garantizado'].toString();
          planillaEnviadaModel.descuento = decodedData[i]['descuento'].toString();
          planillaEnviadaModel.total = decodedData[i]['total'].toString();

          await planillaEnviadaDatabase.insertarPlanillaEnviada(planillaEnviadaModel);


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