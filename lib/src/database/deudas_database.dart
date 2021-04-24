


























import 'package:secedo_unap/src/model/deudas_model.dart'; 

import 'database_provider.dart';

class DeudasDatabase{

  final dbprovider = DatabaseProvider.db;

  insertarDeudas(DeudasModel deudas)async{
    try{
      final db = await dbprovider.database;

      final res = await db.rawInsert(
          "INSERT OR REPLACE INTO Deudas (idPersona,idAfiliacion,codigo,"
          "nombre,cesantia,funeral,jubilacion,multa,apr,capital,interes,garantizado,fechaAtual,descuento) "
              "VALUES ('${deudas.idPersona}','${deudas.idAfiliacion}',"
              "'${deudas.codigo}','${deudas.nombre}','${deudas.cesantia}',"
              "'${deudas.funeral}','${deudas.jubilacion}','${deudas.multa}',"
              "'${deudas.apr}','${deudas.capital}','${deudas.interes}',"
              "'${deudas.garantizado}','${deudas.fechaAtual}','${deudas.descuento}')");
      return res;

    }catch(exception){
      print(exception);
    }
  }

  Future<List<DeudasModel>> cargarDeudas() async {
    final db = await dbprovider.database; 
    final res =
    await db.rawQuery("SELECT * FROM Deudas ");

    List<DeudasModel> list = res.isNotEmpty
        ? res.map((c) => DeudasModel.fromJson(c)).toList()
        : [];

    return list;
  }
 

  deleteDeudas() async {
    final db = await dbprovider.database;

    final res = await db.rawDelete("DELETE FROM Deudas");

    return res;
  }
 
}