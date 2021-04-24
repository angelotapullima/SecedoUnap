

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/database/afiliados_database.dart';
import 'package:secedo_unap/src/model/afiliados_model.dart';
import 'package:secedo_unap/src/utils/constants.dart';

class AfiliadosApi {
  final afiliadosDatabase = AfiliadosDatabase();

  Future<bool> obtenerAfiliados() async {
    final afis = await afiliadosDatabase.cargarAfiliados();

    if (afis.length > 0) {
      return true;
    } else {
      try {
        //id es el id del usuario
        final url = Uri.parse('$apiBaseURL/api/Afiliados');

        final resp = await http.get(
            url); //(url, body: {'id_empresa': id, 'app': 'true', 'tn': prefs.token});

        final decodedData = json.decode(resp.body);

        if (decodedData.length > 0) {
          for (int i = 0; i < decodedData.length; i++) {
            AfiliadosModel afiliados = AfiliadosModel();

            afiliados.idPersona = decodedData[i]['id_persona'].toString();
            afiliados.idTipoPersonaDtipoPersona = decodedData[i]
                    ['id_tipo_de_persona_dtipo_de_persona']
                .toString();
            afiliados.idFacultadDfacultad =
                decodedData[i]['id_facultad_dfacultad'].toString();
            afiliados.codigo = decodedData[i]['codigo'].toString();
            afiliados.nombrePersona =
                decodedData[i]['nombre_persona'].toString();
            afiliados.apellidoPaterno =
                decodedData[i]['apellido_paterno'].toString();
            afiliados.apellidoMaterno =
                decodedData[i]['apellido_materno'].toString();
            afiliados.direccion = decodedData[i]['direccion'].toString();
            afiliados.telefono = decodedData[i]['telefono'].toString();
            afiliados.celular = decodedData[i]['celular'].toString();
            afiliados.correo = decodedData[i]['correo'].toString();
            afiliados.imagen = decodedData[i]['imagen'].toString();
            afiliados.nvecesPersona =
                decodedData[i]['nveces_persona'].toString();
            afiliados.fechaNombramiento =
                decodedData[i]['fecha_nombramiento'].toString();
            afiliados.dni = decodedData[i]['DNI'].toString();
            afiliados.cuentaBN = decodedData[i]['cuenta_BN'].toString();
            afiliados.fechaNac = decodedData[i]['fecha_nac'].toString();
            afiliados.tipoPersona = decodedData[i]['tipo_persona'].toString();
            afiliados.tipoAfiliado = decodedData[i]['tipo_afiliado'].toString();
            afiliados.facultad = decodedData[i]['facultad'].toString();
            afiliados.idAfiliacion = decodedData[i]['id_afiliacion'].toString();
            afiliados.idPersonaDpersona =
                decodedData[i]['id_persona_dpersona'].toString();
            afiliados.fechaAfiliacion =
                decodedData[i]['fecha_de_afiliacion'].toString();
            afiliados.fechaCesantia =
                decodedData[i]['fecha_de_cesantia'].toString();
            afiliados.nveces = decodedData[i]['nveces'].toString();
            afiliados.fechaDesafiliacion =
                decodedData[i]['fecha_de_desafiliacion'].toString();
            afiliados.nombreCompleto =
                '${afiliados.nombrePersona} ${afiliados.apellidoPaterno} ${afiliados.apellidoMaterno}';

            await afiliadosDatabase.insertarAfiliados(afiliados);
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
}
