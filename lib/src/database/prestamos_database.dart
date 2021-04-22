













import 'package:secedo_unap/src/model/prestamos_model.dart';

import 'database_provider.dart';

class PrestamosDatabase{

  final dbprovider = DatabaseProvider.db;

  insertarPrestamos(PrestamosModel prestamos)async{
    try{
      final db = await dbprovider.database;

      final res = await db.rawInsert(
          "INSERT OR REPLACE INTO Prestamos (idPrestamo,cheque,fSolicitud,"
          "solicitado,fAprobado,aprobado,girar,tInteres,nCuotas,tipo,prioridad,garante,fechaActualizado,idPersona) "
              "VALUES ('${prestamos.idPrestamo}','${prestamos.cheque}','${prestamos.fSolicitud}',"
              "'${prestamos.solicitado}','${prestamos.fAprobado}','${prestamos.aprobado}','${prestamos.girar}',"
              "'${prestamos.tInteres}','${prestamos.nCuotas}','${prestamos.tipo}','${prestamos.prioridad}',"
              "'${prestamos.garante}','${prestamos.fechaActualizado}','${prestamos.idPersona}')");
      return res;

    }catch(exception){
      print(exception);
    }
  }

  Future<List<PrestamosModel>> cargarPrestamos() async {
    final db = await dbprovider.database; 
    final res =
    await db.rawQuery("SELECT * FROM Prestamos");

    List<PrestamosModel> list = res.isNotEmpty
        ? res.map((c) => PrestamosModel.fromJson(c)).toList()
        : [];

    return list;
  }
 

 
}