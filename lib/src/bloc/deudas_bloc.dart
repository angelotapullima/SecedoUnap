import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/deudas_api.dart';

import 'package:secedo_unap/src/database/deudas_database.dart';
import 'package:secedo_unap/src/model/deudas_model.dart';

class DeudasBloc {
  final deudasDatabase = DeudasDatabase();
  final deudasApi = DeudasApi();

  final _deudasController = BehaviorSubject<List<DeudasModel>>();

  Stream<List<DeudasModel>> get deudaControllerStream =>
      _deudasController.stream;

  dispose() {
    _deudasController.close();
  }

  void obtenerDeudas() async {
    _deudasController.sink.add(await deudaspe());
    await deudasApi.obtenerDeudas();
    _deudasController.sink.add(await deudaspe());
  }

  Future<List<DeudasModel>> deudaspe() async {
    final List<DeudasModel> listGeneral = [];

    final deudasList = await deudasDatabase.cargarDeudas();

    if (deudasList.length > 0) {
      for (var i = 0; i < deudasList.length; i++) {
        String estadoDeuda =
            (double.parse(deudasList[0].capital ?? '') > 0) ? '1' : '0';
        DeudasModel deudas = DeudasModel();

        deudas.idPersona = deudasList[0].idPersona;
        deudas.idAfiliacion = deudasList[0].idAfiliacion;
        deudas.codigo = deudasList[0].codigo;
        deudas.nombre = deudasList[0].nombre;
        deudas.cesantia = deudasList[0].cesantia;
        deudas.funeral = deudasList[0].funeral;
        deudas.jubilacion = deudasList[0].jubilacion;
        deudas.multa = deudasList[0].multa;
        deudas.apr = deudasList[0].apr;
        deudas.capital = deudasList[0].capital;
        deudas.interes = deudasList[0].interes;
        deudas.garantizado = deudasList[0].garantizado;
        deudas.descuento = deudasList[0].descuento;
        deudas.estadoDeuda = estadoDeuda;
        deudas.fechaAtual = deudasList[0].fechaAtual;

        listGeneral.add(deudas);
      }
    }

    return listGeneral;
  }
}
