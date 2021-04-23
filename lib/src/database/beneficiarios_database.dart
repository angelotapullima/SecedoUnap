

















import 'package:secedo_unap/src/model/beneficiarios_model.dart';
import 'database_provider.dart';

class BeneficiariosDatabase{

  final dbprovider = DatabaseProvider.db;

  insertarBeneficiarios(BeneficiariosModel beneficiarios)async{
    try{
      final db = await dbprovider.database;

      final res = await db.rawInsert(
          "INSERT OR REPLACE INTO Beneficiarios (idBeneficiario,idPersona,nombre,"
          "gradoParentesco,porcentaje,funeral,beneficioFallecimiento,fallecido,"
          "idGradoParentesco,defuncion,cartaDeclaratoria,observaciones) "
              "VALUES ('${beneficiarios.idBeneficiario}','${beneficiarios.idPersona}','${beneficiarios.nombre}',"
              "'${beneficiarios.gradoParentesco}','${beneficiarios.porcentaje}','${beneficiarios.funeral}',"
              "'${beneficiarios.beneficioFallecimiento}','${beneficiarios.fallecido}','${beneficiarios.idGradoParentesco}',"
              "'${beneficiarios.defuncion}','${beneficiarios.cartaDeclaratoria}','${beneficiarios.observaciones}')");
      return res;

    }catch(exception){
      print(exception);
    }
  }

  Future<List<BeneficiariosModel>> cargarBeneficiarios() async {
    final db = await dbprovider.database; 
    final res =
    await db.rawQuery("SELECT * FROM Beneficiarios");

    List<BeneficiariosModel> list = res.isNotEmpty
        ? res.map((c) => BeneficiariosModel.fromJson(c)).toList()
        : [];

    return list;
  }
 

 
}