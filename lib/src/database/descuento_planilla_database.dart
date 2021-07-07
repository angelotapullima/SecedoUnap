

















import 'package:secedo_unap/src/model/descuento_planilla_model.dart';

import 'database_provider.dart';

class DescuentoPlanillaDatabase{

  final dbprovider = DatabaseProvider.db;

  insertarDescuentosPlanillas(DescuentoPlanillaModel descuentoPlanillaModel)async{
    try{
      final db = await dbprovider.database;

      final res = await db.rawInsert(
          "INSERT OR REPLACE INTO DescuentoPlanilla (idDescuentoPlanilla,idAfiliacion,codigo,"
          "nombre,fecha,cesantia,funeral,jubilacion,otros,multa,apr,garantizado,"
          "descuento,ntotal,aplicado,diferencia,idPersona,posicion) "
              "VALUES ('${descuentoPlanillaModel.idDescuentoPlanilla}','${descuentoPlanillaModel.idAfiliacion}',"
              "'${descuentoPlanillaModel.codigo}','${descuentoPlanillaModel.nombre}','${descuentoPlanillaModel.fecha}',"
              "'${descuentoPlanillaModel.cesantia}','${descuentoPlanillaModel.funeral}','${descuentoPlanillaModel.jubilacion}',"
              "'${descuentoPlanillaModel.otros}','${descuentoPlanillaModel.multa}','${descuentoPlanillaModel.apr}',"
              "'${descuentoPlanillaModel.garantizado}','${descuentoPlanillaModel.descuento}','${descuentoPlanillaModel.ntotal}',"
              "'${descuentoPlanillaModel.aplicado}','${descuentoPlanillaModel.diferencia}','${descuentoPlanillaModel.idPersona}','${descuentoPlanillaModel.posicion}')");
      return res;

    }catch(exception){
      print(exception);
    }
  }

  Future<List<DescuentoPlanillaModel>> cargarDescuentosPlanillas() async {
    final db = await dbprovider.database; 
    final res =
    await db.rawQuery("SELECT * FROM DescuentoPlanilla order by idDescuentoPlanilla desc");

    List<DescuentoPlanillaModel> list = res.isNotEmpty
        ? res.map((c) => DescuentoPlanillaModel.fromJson(c)).toList()
        : [];

    return list;
  }
 

  deleteDescuentoPlanilla() async {
    final db = await dbprovider.database;

    final res = await db.rawDelete("DELETE FROM DescuentoPlanilla");

    return res;
  }
 
}