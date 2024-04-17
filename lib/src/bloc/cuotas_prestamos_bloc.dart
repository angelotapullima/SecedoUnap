import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/cuotas_prestamo_api.dart';
import 'package:secedo_unap/src/database/cuotas_prestamos_database.dart';
import 'package:secedo_unap/src/model/cuotas_prestamos_model.dart';

class CuotasPrestamosBloc {
  final cuotasPrestamosDatabase = CuotasPrestamosDatabase();
  final cuotasPrestamosApi = CuotasPrestamosApi();

  final _cuotasPrestamosPagadosController =
      BehaviorSubject<List<CuotasPrestamosModel>>();
  final _cuotasPrestamosPendientesController =
      BehaviorSubject<List<CuotasPrestamosModel>>();

  Stream<List<CuotasPrestamosModel>> get cuotasPrestamosPagadosStream =>
      _cuotasPrestamosPagadosController.stream;
  Stream<List<CuotasPrestamosModel>> get cuotasPrestamosPendientesStream =>
      _cuotasPrestamosPendientesController.stream;

  dispose() {
    _cuotasPrestamosPagadosController.close();
    _cuotasPrestamosPendientesController.close();
  }

  void obtenerPrestamosPagados(String idPrestamo) async {
    _cuotasPrestamosPagadosController.sink.add(await cuotasPrestamosDatabase
        .obtenerCuotasPorPrestamoPorEstado(idPrestamo, '1'));
    await cuotasPrestamosApi.obtenerCuotasPrestamos(idPrestamo);
    _cuotasPrestamosPagadosController.sink.add(await cuotasPrestamosDatabase
        .obtenerCuotasPorPrestamoPorEstado(idPrestamo, '1'));
  }

  void obtenerPrestamosPendientes(String idPrestamo) async {
    _cuotasPrestamosPendientesController.sink.add(await cuotasPrestamosDatabase
        .obtenerCuotasPorPrestamoPorEstado(idPrestamo, '0'));
    await cuotasPrestamosApi.obtenerCuotasPrestamos(idPrestamo);
    _cuotasPrestamosPendientesController.sink.add(await cuotasPrestamosDatabase
        .obtenerCuotasPorPrestamoPorEstado(idPrestamo, '0'));
  }
}
