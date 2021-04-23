import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/beneficiarios_api.dart';
import 'package:secedo_unap/src/database/beneficiarios_database.dart';
import 'package:secedo_unap/src/model/beneficiarios_model.dart';

class BeneficiariosBloc {
  final beneficiariosDatabase = BeneficiariosDatabase();
  final beneficiariosApi = BeneficiariosApi();

  final _beneficiariosController = BehaviorSubject<List<BeneficiariosList>>();

  Stream<List<BeneficiariosList>> get beneficiariosControllerStream =>
      _beneficiariosController.stream;

  dispose() {
    _beneficiariosController?.close();
  }

  void obtenerBeneficiarios() async {
    _beneficiariosController.sink.add(await benefis());
    await beneficiariosApi.obtenerBeneficiarios();
    _beneficiariosController.sink.add(await benefis());
  }

  Future<List<BeneficiariosList>> benefis() async {
    final List<BeneficiariosList> listGeneral = [];

    final todosBeneficiarios =
        await beneficiariosDatabase.cargarBeneficiarios();

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

      BeneficiariosList beneficiariosList = BeneficiariosList();
      beneficiariosList.funeral = listFuneral;
      beneficiariosList.fallecido = listFallecido;
      beneficiariosList.beneficioFallecido = listBeneficioFallecido;

      listGeneral.add(beneficiariosList);
    }

    return listGeneral;
  }
}

class BeneficiariosList {
  List<BeneficiariosModel> funeral;
  List<BeneficiariosModel> fallecido;
  List<BeneficiariosModel> beneficioFallecido;

  BeneficiariosList({this.funeral, this.fallecido, this.beneficioFallecido});
}
