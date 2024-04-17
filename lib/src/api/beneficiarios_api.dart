import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/database/beneficiarios_database.dart';
import 'package:secedo_unap/src/model/beneficiarios_model.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/constants.dart';

class BeneficiariosApi {
  final beneficiariosDatabase = BeneficiariosDatabase();
  final preferences = Preferences();

  Future<bool> obtenerBeneficiarios(String idPersona) async {
    try {
      //id es el id del usuario
      final url = Uri.parse('$apiBaseURL/api/Beneficiarios/$idPersona');

      final resp = await http.get(
          url); //(url, body: {'id_empresa': id, 'app': 'true', 'tn': prefs.token});

      final decodedData = json.decode(resp.body);

      if (decodedData.length > 0) {
        for (int i = 0; i < decodedData.length; i++) {
          BeneficiariosModel beneficiarios = BeneficiariosModel();

          beneficiarios.idBeneficiario =
              decodedData[i]['id_afiliado_beneficiario'].toString();
          beneficiarios.idPersona = decodedData[i]['id_persona'].toString();
          beneficiarios.nombre = decodedData[i]['Nombre'].toString();
          beneficiarios.gradoParentesco =
              decodedData[i]['grado_de_parentesco'].toString();
          beneficiarios.porcentaje = decodedData[i]['porcentaje'].toString();
          beneficiarios.funeral = decodedData[i]['funeral'].toString();
          beneficiarios.fallecido = decodedData[i]['fallecido'].toString();
          beneficiarios.beneficioFallecimiento =
              decodedData[i]['beneficio_por_fallecimiento'].toString();
          beneficiarios.idGradoParentesco = decodedData[i]
                  ['id_grado_de_parentesco_dgrado_de_parentesco']
              .toString();
          beneficiarios.defuncion = decodedData[i]['defuncion'].toString();
          beneficiarios.cartaDeclaratoria =
              decodedData[i]['Carta_declaratoria'].toString();
          beneficiarios.observaciones =
              decodedData[i]['Observaciones'].toString();

          await beneficiariosDatabase.insertarBeneficiarios(beneficiarios);
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
