import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/database/afiliados_database.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/constants.dart';

class AfiliadosApi {
  final afiliadosDatabase = AfiliadosDatabase();
  final prefs = Preferences();

  /* Future<bool> obtenerAfiliados() async {
    final afis = await afiliadosDatabase.cargarAfiliados();

    if (afis.length > 0) {
      return true;
    } else {

      //$apiBaseURL/api/Afiliados?dni=555555
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
            afiliados.idTipoPersonaDtipoPersona = decodedData[i]['id_tipo_de_persona_dtipo_de_persona'].toString();
            afiliados.idFacultadDfacultad =decodedData[i]['id_facultad_dfacultad'].toString();
            afiliados.codigo = decodedData[i]['codigo'].toString();
            afiliados.nombrePersona =decodedData[i]['nombre_persona'].toString();
            afiliados.apellidoPaterno =decodedData[i]['apellido_paterno'].toString();
            afiliados.apellidoMaterno = decodedData[i]['apellido_materno'].toString();
            afiliados.direccion = decodedData[i]['direccion'].toString();
            afiliados.telefono = decodedData[i]['telefono'].toString();
            afiliados.celular = decodedData[i]['celular'].toString();
            afiliados.correo = decodedData[i]['correo'].toString();
            afiliados.imagen = decodedData[i]['imagen'].toString();
            afiliados.nvecesPersona =decodedData[i]['nveces_persona'].toString();
            afiliados.fechaNombramiento =decodedData[i]['fecha_nombramiento'].toString();
            afiliados.dni = decodedData[i]['DNI'].toString();
            afiliados.cuentaBN = decodedData[i]['cuenta_BN'].toString();
            afiliados.fechaNac = decodedData[i]['fecha_nac'].toString();
            afiliados.tipoPersona = decodedData[i]['tipo_persona'].toString();
            afiliados.tipoAfiliado = decodedData[i]['tipo_afiliado'].toString();
            afiliados.facultad = decodedData[i]['facultad'].toString();
            afiliados.idAfiliacion = decodedData[i]['id_afiliacion'].toString();
            afiliados.idPersonaDpersona =decodedData[i]['id_persona_dpersona'].toString();
            afiliados.fechaAfiliacion =decodedData[i]['fecha_de_afiliacion'].toString();
            afiliados.fechaCesantia =decodedData[i]['fecha_de_cesantia'].toString();
            afiliados.nveces = decodedData[i]['nveces'].toString();
            afiliados.fechaDesafiliacion =decodedData[i]['fecha_de_desafiliacion'].toString();
            afiliados.nombreCompleto = '${afiliados.nombrePersona} ${afiliados.apellidoPaterno} ${afiliados.apellidoMaterno}';

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

 */
  Future<bool> obtenerAfiliadosDni(String dni) async {
    //$apiBaseURL/api/Afiliados?dni=555555
    try {
      //id es el id del usuario
      final url = Uri.parse('$apiBaseURL/api/Afiliados?$dni');

      final resp = await http.get(
          url); //(url, body: {'id_empresa': id, 'app': 'true', 'tn': prefs.token});

      final decodedData = json.decode(resp.body);

      if (decodedData.length > 0) { 
          String ano;
          String yearAfi, mesAfi, diaAfi;

          String fechaNacimiento;
          var fechaNac = decodedData[0]['fecha_nac'].toString();
          List fechexNac = fechaNac.split('T');
          fechaNacimiento = fechexNac[0].trim();

          var age = fechaNacimiento;
          List fechexAge = age.split('-');
          ano = fechexAge[0].trim();

          String fechaAfiliacion;
          var fechaAfi = decodedData[0]['fecha_de_afiliacion'].toString();
          List fechexAfi = fechaAfi.split('T');
          fechaAfiliacion = fechexAfi[0].trim();

          var fechaAfix = fechaAfiliacion;
          List fechinAfi = fechaAfix.split('-');
          yearAfi = fechinAfi[0].trim();
          mesAfi = fechinAfi[1].trim();
          diaAfi = fechinAfi[2].trim();

          String fechaNombramiento;
          var fechaNom = decodedData[0]['fecha_nombramiento'].toString();
          List fechexNom = fechaNom.split('T');
          fechaNombramiento = fechexNom[0].trim();

          String fechaDesafiliacion;
          var fechaDes = decodedData[0]['fecha_de_desafiliacion'].toString();
          List fechexDes = fechaDes.split('T');
          fechaDesafiliacion = fechexDes[0].trim();

          prefs.yearNacimiento = ano;
          prefs.yearAfiliacion = yearAfi;
          prefs.mesAfiliacion = mesAfi;
          prefs.diaAfiliacion = diaAfi;
          prefs.idPersona = decodedData[0]['id_persona'].toString();
          prefs.idTipoPersonaDtipoPersona =decodedData[0]['id_tipo_de_persona_dtipo_de_persona'].toString();
          prefs.idFacultadDfacultad = decodedData[0]['id_facultad_dfacultad'].toString();
          prefs.codigo = decodedData[0]['codigo'].toString();
          prefs.nombrePersona = decodedData[0]['nombre_persona'].toString();
          prefs.apellidoPaterno = decodedData[0]['apellido_paterno'].toString();
          prefs.apellidoMaterno = decodedData[0]['apellido_materno'].toString();
          prefs.direccion = decodedData[0]['direccion'].toString();
          prefs.telefono = decodedData[0]['telefono'].toString();
          prefs.celular = decodedData[0]['celular'].toString();
          prefs.correo = decodedData[0]['correo'].toString();
          prefs.imagen = decodedData[0]['imagen'].toString();
          prefs.nvecesPersona = decodedData[0]['nveces_persona'].toString();
          prefs.fechaNombramiento = fechaNombramiento;
          prefs.dni = decodedData[0]['DNI'].toString();
          prefs.cuentaBN = decodedData[0]['cuenta_BN'].toString();
          prefs.fechaNac = fechaNacimiento;
          prefs.tipoPersona = decodedData[0]['tipo_persona'].toString();
          prefs.tipoAfiliado = decodedData[0]['tipo_afiliado'].toString();
          prefs.facultad = decodedData[0]['facultad'].toString();
          prefs.idAfiliacion = decodedData[0]['id_afiliacion'].toString();
          prefs.idPersonaDpersona = decodedData[0]['id_persona_dpersona'].toString();
          prefs.fechaAfiliacion = fechaAfiliacion;
          prefs.fechaCesantia = decodedData[0]['fecha_de_cesantia'].toString();
          prefs.nveces = decodedData[0]['nveces'].toString();
          prefs.fechaDesafiliacion = fechaDesafiliacion;
        

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
