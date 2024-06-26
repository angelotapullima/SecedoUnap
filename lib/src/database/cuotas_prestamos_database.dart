import 'package:secedo_unap/src/database/database_provider.dart';
import 'package:secedo_unap/src/model/cuotas_prestamos_model.dart';

class CuotasPrestamosDatabase {
  final dbprovider = DatabaseProvider.instance;

  insertarCuotasPrestamos(CuotasPrestamosModel cuotaPrestamo) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawInsert(
          "INSERT OR REPLACE INTO CuotasPrestamo (idCuota,idPrestamo,vencimiento,monto,fpago,"
          "pagado,principal,interes,posicion,estadoPagado,cuota) "
          "VALUES ('${cuotaPrestamo.idCuota}','${cuotaPrestamo.idPrestamo}','${cuotaPrestamo.vencimiento}',"
          "'${cuotaPrestamo.monto}','${cuotaPrestamo.fpago}','${cuotaPrestamo.pagado}','${cuotaPrestamo.principal}',"
          "'${cuotaPrestamo.interes}','${cuotaPrestamo.posicion}','${cuotaPrestamo.estadoPagado}',"
          "'${cuotaPrestamo.cuota}')");
      return res;
    } catch (exception) {
      print(exception);
    }
  }

  Future<List<CuotasPrestamosModel>> obtenerCuotasPorPrestamoPorEstado(
      String idPrestamo, String estado) async {
    final db = await dbprovider.database;
    final res = await db.rawQuery(
        "SELECT * FROM CuotasPrestamo where idPrestamo='$idPrestamo' and estadoPagado='$estado' order by CAST(idCuota AS INT)");

    List<CuotasPrestamosModel> list = res.isNotEmpty
        ? res.map((c) => CuotasPrestamosModel.fromJson(c)).toList()
        : [];

    return list;
  }

  Future<List<CuotasPrestamosModel>> obtenerCuotasPorPrestam(
      String idPrestamo) async {
    final db = await dbprovider.database;
    final res = await db.rawQuery(
        "SELECT * FROM CuotasPrestamo where idPrestamo='$idPrestamo'  order by CAST(idCuota AS INT)");

    List<CuotasPrestamosModel> list = res.isNotEmpty
        ? res.map((c) => CuotasPrestamosModel.fromJson(c)).toList()
        : [];

    return list;
  }

  deleteCuotasPrestamos() async {
    final db = await dbprovider.database;

    final res = await db.rawDelete("DELETE FROM CuotasPrestamo");

    return res;
  }
}
