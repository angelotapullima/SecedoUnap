import 'package:secedo_unap/src/model/afiliados_model.dart';
import 'database_provider.dart';

class AfiliadosDatabase {
  final dbprovider = DatabaseProvider.instance;

  insertarAfiliados(AfiliadosModel afiliados) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawInsert(
          "INSERT OR REPLACE INTO Afiliados (idPersona,idTipoPersonaDtipoPersona,idFacultadDfacultad,codigo,"
          "nombrePersona,apellidoPaterno,apellidoMaterno,direccion,telefono,celular,correo,imagen,nvecesPersona,"
          "fechaNombramiento,dni,cuentaBN,fechaNac,tipoPersona,tipoAfiliado,facultad,idAfiliacion,idPersonaDpersona,"
          "fechaAfiliacion,fechaCesantia,nveces,nombreCompleto,fechaDesafiliacion) "
          "VALUES ('${afiliados.idPersona}','${afiliados.idTipoPersonaDtipoPersona}','${afiliados.idFacultadDfacultad}',"
          "'${afiliados.codigo}','${afiliados.nombrePersona}','${afiliados.apellidoPaterno}','${afiliados.apellidoMaterno}',"
          "'${afiliados.direccion}','${afiliados.telefono}','${afiliados.celular}','${afiliados.correo}','${afiliados.imagen}',"
          "'${afiliados.nvecesPersona}','${afiliados.fechaNombramiento}','${afiliados.dni}','${afiliados.cuentaBN}',"
          "'${afiliados.fechaNac}','${afiliados.tipoPersona}','${afiliados.tipoAfiliado}','${afiliados.facultad}',"
          "'${afiliados.idAfiliacion}','${afiliados.idPersonaDpersona}','${afiliados.fechaAfiliacion}','${afiliados.fechaCesantia}',"
          "'${afiliados.nveces}','${afiliados.nombreCompleto}','${afiliados.fechaDesafiliacion}')");
      return res;
    } catch (exception) {
      print(exception);
    }
  }

  Future<List<AfiliadosModel>> cargarAfiliados() async {
    final db = await dbprovider.database;
    final res = await db.rawQuery("SELECT * FROM Afiliados");

    List<AfiliadosModel> list = res.isNotEmpty
        ? res.map((c) => AfiliadosModel.fromJson(c)).toList()
        : [];

    return list;
  }

  Future<List<AfiliadosModel>> cargarAfiliadoPorDni(String dni) async {
    final db = await dbprovider.database;
    final res = await db.rawQuery("SELECT * FROM Afiliados where dni='$dni'");

    List<AfiliadosModel> list = res.isNotEmpty
        ? res.map((c) => AfiliadosModel.fromJson(c)).toList()
        : [];

    return list;
  }

  Future<List<AfiliadosModel>> consultarPersonaPorQuery(String query) async {
    try {
      final db = await dbprovider.database;
      final res = await db.rawQuery(
          "SELECT * FROM Afiliados WHERE nombreCompleto LIKE '%$query%' or dni LIKE '%$query%'");

      List<AfiliadosModel> list = res.isNotEmpty
          ? res.map((c) => AfiliadosModel.fromJson(c)).toList()
          : [];

      return list;
    } catch (e) {
      print(" $e Error en la base de datossss");
      print(e);
      return [];
    }
  }
}
