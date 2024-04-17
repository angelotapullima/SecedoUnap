import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/planilla_enviada_api.dart';
import 'package:secedo_unap/src/database/planilla_enviada_database.dart';
import 'package:secedo_unap/src/model/planilla_enviada_model.dart';
import 'package:secedo_unap/src/utils/utils.dart';

class PlanillaEnviadaBloc {
  final planillaEnviadaDatabase = PlanillaEnviadaDatabase();
  final planillaEnviadaApi = PlanillaEnviadaApi();

  final _planillaEnviadaController =
      BehaviorSubject<List<PlanillaEnviadaModel>>();

  Stream<List<PlanillaEnviadaModel>> get planillaEnviadaControllerStream =>
      _planillaEnviadaController.stream;

  dispose() {
    _planillaEnviadaController.close();
  }

  void obtenerPlanillaEnviada() async {
    _planillaEnviadaController.sink.add(await planillape());
    await planillaEnviadaApi.obtenerPlanillaEnviada();
    _planillaEnviadaController.sink.add(await planillape());
  }

  Future<List<PlanillaEnviadaModel>> planillape() async {
    final List<PlanillaEnviadaModel> listGeneral = [];

    final planillas = await planillaEnviadaDatabase.cargarPlanillaEnviada();

    if (planillas.length > 0) {
      for (var i = 0; i < planillas.length; i++) {
        String fechaCompleta;
        String mes;
        String ano;

        String fechex = planillas[0].fecha ?? '';
        List partesfechex = fechex.split('-');
        mes = partesfechex[1].trim();
        ano = partesfechex[0].trim();

        String mesCompleto = obtenerMes(int.parse(mes));

        fechaCompleta = '$mesCompleto  $ano';

        PlanillaEnviadaModel planillaEnviadaModel = PlanillaEnviadaModel();

        planillaEnviadaModel.idPlanillaEnviada = planillas[0].idPlanillaEnviada;
        planillaEnviadaModel.idAfiliacion = planillas[0].idAfiliacion;
        planillaEnviadaModel.tipoPlanilla = planillas[0].tipoPlanilla;
        planillaEnviadaModel.fecha = planillas[0].fecha;
        planillaEnviadaModel.cesantia = planillas[0].cesantia;
        planillaEnviadaModel.funeral = planillas[0].funeral;
        planillaEnviadaModel.jubilacion = planillas[0].jubilacion;
        planillaEnviadaModel.multa = planillas[0].multa;
        planillaEnviadaModel.apr = planillas[0].apr;
        planillaEnviadaModel.garantizado = planillas[0].garantizado;
        planillaEnviadaModel.descuento = planillas[0].descuento;
        planillaEnviadaModel.total = planillas[0].total;
        planillaEnviadaModel.fechaOriginal = fechaCompleta;

        print('${planillaEnviadaModel.fecha}');

        listGeneral.add(planillaEnviadaModel);
      }
    }

    return listGeneral;
  }
}
