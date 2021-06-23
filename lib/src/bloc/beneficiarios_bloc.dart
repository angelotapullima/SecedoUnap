import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/beneficiarios_api.dart';
import 'package:secedo_unap/src/database/beneficiarios_database.dart';
import 'package:secedo_unap/src/model/beneficiarios_model.dart';

class BeneficiariosBloc {
  final beneficiariosDatabase = BeneficiariosDatabase();
  final beneficiariosApi = BeneficiariosApi();

  final _beneficiariosController = BehaviorSubject<List<BeneficiariosGeneral>>();
  final _beneficiariosAfiliadosController = BehaviorSubject<List<BeneficiariosGeneral>>();

  Stream<List<BeneficiariosGeneral>> get beneficiariosControllerStream => _beneficiariosController.stream;
  Stream<List<BeneficiariosGeneral>> get beneficiariosAfiliadosControllerStream => _beneficiariosAfiliadosController.stream;

  dispose() {
    _beneficiariosController?.close();
    _beneficiariosAfiliadosController?.close();
  }

  void obtenerBeneficiariosPorIdPersona(String idPersona) async {
    _beneficiariosController.sink.add(await benefis(idPersona));
    await beneficiariosApi.obtenerBeneficiarios(idPersona);
    _beneficiariosController.sink.add(await benefis(idPersona));
  }

   void obtenerBeneficiariosAfiliadosPorIdPersona(String idPersona) async {
    _beneficiariosAfiliadosController.sink.add(await benefis(idPersona));
    await beneficiariosApi.obtenerBeneficiarios(idPersona);
    _beneficiariosAfiliadosController.sink.add(await benefis(idPersona));
  }

  Future<List<BeneficiariosGeneral>> benefis(String idPersona) async {
    final List<BeneficiariosGeneral> listBeneficiariosGeneral = []; 

    final todosBeneficiarios =
        await beneficiariosDatabase.cargarBeneficiariosPorIdPersona(idPersona);

    if (todosBeneficiarios.length > 0) {
      final List<BeneficiariosModel> listFuneral = [];
      final List<BeneficiariosModel> listFallecido = [];
      final List<BeneficiariosModel> listBeneficioFallecido = [];

      for (var i = 0; i < todosBeneficiarios.length; i++) {
        if (todosBeneficiarios[i].funeral == 'true') {
          BeneficiariosModel beneficiariosModel = BeneficiariosModel();

          beneficiariosModel.idBeneficiario =
              todosBeneficiarios[i].idBeneficiario;
          beneficiariosModel.nombre = todosBeneficiarios[i].nombre;
          beneficiariosModel.idPersona = todosBeneficiarios[i].idPersona;
          beneficiariosModel.gradoParentesco =
              todosBeneficiarios[i].gradoParentesco;
          beneficiariosModel.porcentaje = todosBeneficiarios[i].porcentaje;
          beneficiariosModel.funeral = todosBeneficiarios[i].funeral;
          beneficiariosModel.beneficioFallecimiento =
              todosBeneficiarios[i].beneficioFallecimiento;
          beneficiariosModel.fallecido = todosBeneficiarios[i].fallecido;
          beneficiariosModel.defuncion = todosBeneficiarios[i].defuncion;
          beneficiariosModel.cartaDeclaratoria =
              todosBeneficiarios[i].cartaDeclaratoria;
          beneficiariosModel.observaciones =
              todosBeneficiarios[i].observaciones;
          listFuneral.add(beneficiariosModel);
        }

        if (todosBeneficiarios[i].fallecido == 'true') {
          BeneficiariosModel beneficiariosModel = BeneficiariosModel();

          beneficiariosModel.idBeneficiario =
              todosBeneficiarios[i].idBeneficiario;
          beneficiariosModel.nombre = todosBeneficiarios[i].nombre;
          beneficiariosModel.idPersona = todosBeneficiarios[i].idPersona;
          beneficiariosModel.gradoParentesco =
              todosBeneficiarios[i].gradoParentesco;
          beneficiariosModel.porcentaje = todosBeneficiarios[i].porcentaje;
          beneficiariosModel.funeral = todosBeneficiarios[i].funeral;
          beneficiariosModel.beneficioFallecimiento =
              todosBeneficiarios[i].beneficioFallecimiento;
          beneficiariosModel.fallecido = todosBeneficiarios[i].fallecido;
          beneficiariosModel.defuncion = todosBeneficiarios[i].defuncion;
          beneficiariosModel.cartaDeclaratoria =
              todosBeneficiarios[i].cartaDeclaratoria;
          beneficiariosModel.observaciones =
              todosBeneficiarios[i].observaciones;
          listFallecido.add(beneficiariosModel);
        }
        if (todosBeneficiarios[i].beneficioFallecimiento == 'true') {
          BeneficiariosModel beneficiariosModel = BeneficiariosModel();

          beneficiariosModel.idBeneficiario =
              todosBeneficiarios[i].idBeneficiario;
          beneficiariosModel.nombre = todosBeneficiarios[i].nombre;
          beneficiariosModel.idPersona = todosBeneficiarios[i].idPersona;
          beneficiariosModel.gradoParentesco =
              todosBeneficiarios[i].gradoParentesco;
          beneficiariosModel.porcentaje = todosBeneficiarios[i].porcentaje;
          beneficiariosModel.funeral = todosBeneficiarios[i].funeral;
          beneficiariosModel.beneficioFallecimiento =
              todosBeneficiarios[i].beneficioFallecimiento;
          beneficiariosModel.fallecido = todosBeneficiarios[i].fallecido;
          beneficiariosModel.defuncion = todosBeneficiarios[i].defuncion;
          beneficiariosModel.cartaDeclaratoria =
              todosBeneficiarios[i].cartaDeclaratoria;
          beneficiariosModel.observaciones =
              todosBeneficiarios[i].observaciones;
          listBeneficioFallecido.add(beneficiariosModel);
        }
      }

      
      if (listBeneficioFallecido.length > 0) {
        BeneficiariosGeneral beneficiariosGeneral = BeneficiariosGeneral();
        beneficiariosGeneral.tipo = '1';
        beneficiariosGeneral.texto = 'Beneficiarios con derecho al fondo de cesantía y bolsa de jubulación';

        final List<Beneficiarios> beneAlgo = [];

        for (var i = 0; i < listBeneficioFallecido.length; i++) {
          Beneficiarios bene = Beneficiarios();
          bene.nombre = listBeneficioFallecido[i].nombre;
          bene.parentesco = listBeneficioFallecido[i].gradoParentesco;
          bene.porcentaje = double.parse(listBeneficioFallecido[i].porcentaje).toInt().toString();
          bene.observacion = listBeneficioFallecido[i].observaciones;

          beneAlgo.add(bene);
        }
        beneficiariosGeneral.beneficiarios =beneAlgo;
        listBeneficiariosGeneral.add(beneficiariosGeneral);
      }

      if (listFallecido.length > 0) {
        BeneficiariosGeneral beneficiariosGeneral = BeneficiariosGeneral();
        beneficiariosGeneral.tipo = '0';
        beneficiariosGeneral.texto = 'Derecho como afiliado al cobro del fondo de funerales';

        final List<Beneficiarios> beneAlgo = [];

        for (var i = 0; i < listFallecido.length; i++) {
          Beneficiarios bene = Beneficiarios();
          bene.nombre = listFallecido[i].nombre;
          bene.parentesco = listFallecido[i].gradoParentesco;
          bene.porcentaje = double.parse(listFallecido[i].porcentaje).toInt().toString();
          bene.observacion = listFallecido[i].observaciones;

          beneAlgo.add(bene);
        }
        beneficiariosGeneral.beneficiarios =beneAlgo;
        listBeneficiariosGeneral.add(beneficiariosGeneral);
      }

      if (listFuneral.length > 0) {
        BeneficiariosGeneral beneficiariosGeneral = BeneficiariosGeneral();
        beneficiariosGeneral.tipo = '0';
        beneficiariosGeneral.texto = 'A mi fallecimiento el fondo de funerales debe entregarse a:';

        final List<Beneficiarios> beneAlgo = [];

        for (var i = 0; i < listFuneral.length; i++) {
          Beneficiarios bene = Beneficiarios();
          bene.nombre = listFuneral[i].nombre;
          bene.parentesco = listFuneral[i].gradoParentesco;
          bene.porcentaje = double.parse(listFuneral[i].porcentaje).toInt().toString();
          bene.observacion = listFallecido[i].observaciones;

          beneAlgo.add(bene);
        }
        beneficiariosGeneral.beneficiarios =beneAlgo;
        listBeneficiariosGeneral.add(beneficiariosGeneral);
      }

      /* BeneficiariosList beneficiariosList = BeneficiariosList();
      beneficiariosList.funeral = listFuneral;
      beneficiariosList.fallecido = listFallecido;
      beneficiariosList.beneficioFallecido = listBeneficioFallecido; */

      //listGeneral.add(listBeneficiariosGeneral);
    }

    return listBeneficiariosGeneral;
  }
}

class BeneficiariosList {
  List<BeneficiariosModel> funeral;
  List<BeneficiariosModel> fallecido;
  List<BeneficiariosModel> beneficioFallecido;
  List<BeneficiariosGeneral> beneficiariosGeneral;

  BeneficiariosList({this.funeral, this.fallecido, this.beneficioFallecido});
}

class BeneficiariosGeneral {
  String tipo;
  String texto;
  List<Beneficiarios> beneficiarios;

  BeneficiariosGeneral({this.tipo, this.beneficiarios, this.texto});
}

class Beneficiarios {
  Beneficiarios({this.porcentaje, this.nombre, this.parentesco,this.observacion});

  String porcentaje;
  String nombre;
  String parentesco;
  String observacion;
  
}
