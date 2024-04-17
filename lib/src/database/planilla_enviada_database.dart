import 'package:secedo_unap/src/model/planilla_enviada_model.dart';

import 'database_provider.dart';

class PlanillaEnviadaDatabase {
  final dbprovider = DatabaseProvider.instance;

  insertarPlanillaEnviada(PlanillaEnviadaModel planillaEnviadaModel) async {
    try {
      final db = await dbprovider.database;

      final res = await db.rawInsert(
          "INSERT OR REPLACE INTO PlanillaEnviada (idPlanillaEnviada,idAfiliacion,tipoPlanilla,"
          "fecha,cesantia,funeral,jubilacion,multa,apr,garantizado,descuento,total) "
          "VALUES ('${planillaEnviadaModel.idPlanillaEnviada}','${planillaEnviadaModel.idAfiliacion}',"
          "'${planillaEnviadaModel.tipoPlanilla}','${planillaEnviadaModel.fecha}','${planillaEnviadaModel.cesantia}',"
          "'${planillaEnviadaModel.funeral}','${planillaEnviadaModel.jubilacion}','${planillaEnviadaModel.multa}',"
          "'${planillaEnviadaModel.apr}','${planillaEnviadaModel.garantizado}','${planillaEnviadaModel.descuento}',"
          "'${planillaEnviadaModel.total}')");
      return res;
    } catch (exception) {
      print(exception);
    }
  }

  Future<List<PlanillaEnviadaModel>> cargarPlanillaEnviada() async {
    final db = await dbprovider.database;
    final res = await db.rawQuery("SELECT * FROM PlanillaEnviada ");

    List<PlanillaEnviadaModel> list = res.isNotEmpty
        ? res.map((c) => PlanillaEnviadaModel.fromJson(c)).toList()
        : [];

    return list;
  }

  deletePlanillaEnviada() async {
    final db = await dbprovider.database;

    final res = await db.rawDelete("DELETE FROM PlanillaEnviada");

    return res;
  }
}
