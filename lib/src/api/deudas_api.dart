























import 'dart:convert';
  
import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/database/deudas_database.dart';
import 'package:secedo_unap/src/model/deudas_model.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';

import 'package:secedo_unap/src/utils/constants.dart'; 
 

class DeudasApi { 
  final deudasDatabase = DeudasDatabase();
  final preferences = Preferences();

  Future<bool> obtenerDeudas() async {
    try {

      //id es el id del usuario
      final url = Uri.parse('$apiBaseURL/api/Deudas/${preferences.idPersona}');

      final resp = await http.get(url);//(url, body: {'id_empresa': id, 'app': 'true', 'tn': prefs.token});

      final decodedData = json.decode(resp.body);

      if (decodedData.length > 0) {

        await deudasDatabase.deleteDeudas();
        for (int i = 0; i < decodedData.length; i++) {

         
         final date = DateTime.now();
          String dia = date.day.toString();
          String mes = date.month.toString();
          String year = date.year.toString();

          DeudasModel deudas = DeudasModel();

          deudas.idPersona = decodedData[i]['id_planilla_enviada'].toString();
          deudas.idAfiliacion = decodedData[i]['id_afiliacion'].toString();
          deudas.codigo = decodedData[i]['codigo'].toString();
          deudas.nombre = decodedData[i]['Nombre'].toString();
          deudas.cesantia = decodedData[i]['cesantia'].toString();
          deudas.funeral = decodedData[i]['funeral'].toString();
          deudas.jubilacion = decodedData[i]['jubilacion'].toString();
          deudas.multa = decodedData[i]['Multa'].toString();
          deudas.apr = decodedData[i]['APR'].toString();
          deudas.capital = decodedData[i]['Capital'].toString();
          deudas.interes = decodedData[i]['interes'].toString();
          deudas.garantizado = decodedData[i]['Garantizado'].toString();
          deudas.descuento = decodedData[i]['Descuento'].toString();
          deudas.fechaAtual = '$dia/$mes/$year';
          await deudasDatabase.insertarDeudas(deudas);


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