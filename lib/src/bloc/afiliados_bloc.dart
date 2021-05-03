import 'package:rxdart/rxdart.dart';
import 'package:secedo_unap/src/api/afiliados_api.dart';
import 'package:secedo_unap/src/database/afiliados_database.dart';
import 'package:secedo_unap/src/model/afiliados_model.dart';

class AfiliadosBloc {
  final afiliadosApi = AfiliadosApi();
  final afiliadosDatabase = AfiliadosDatabase();

  final _afiliadoController = BehaviorSubject<List<AfiliadosModel>>();

  Stream<List<AfiliadosModel>> get afiliadoStream => _afiliadoController.stream;

  dispose() {
    _afiliadoController?.close();
  }

  /* void obtenerAfiliados() async {
    _afiliadoController.sink.add(await afiliadosDatabase.cargarAfiliados());
    await afiliadosApi.obtenerAfiliados();
    _afiliadoController.sink.add(await afiliadosDatabase.cargarAfiliados());
  } */

  void consultaPersonal(String query) async {
    _afiliadoController.sink
        .add(await afiliadosDatabase.consultarPersonaPorQuery(query));
  }
}
