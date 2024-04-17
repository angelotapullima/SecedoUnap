import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/prestamos_api.dart';
import 'package:secedo_unap/src/database/cuotas_prestamos_database.dart';
import 'package:secedo_unap/src/database/prestamos_database.dart';
import 'package:secedo_unap/src/model/prestamos_model.dart';
import 'package:secedo_unap/src/utils/utils.dart';

class PrestamosBloc {
  final prestamosDatabase = PrestamosDatabase();
  final cuotasPrestamosDatabase = CuotasPrestamosDatabase();
  final prestamosApi = PrestamosApi();

  final _prestamosController = BehaviorSubject<List<PrestamosModel>>();

  Stream<List<PrestamosModel>> get prestamosStream =>
      _prestamosController.stream;

  dispose() {
    _prestamosController.close();
  }

  void obtenerPrestamos() async {
    _prestamosController.sink.add(await obtenerPrestamosDatos());
    await prestamosApi.obtenerPrestamos();
    _prestamosController.sink.add(await obtenerPrestamosDatos());
  }

  Future<List<PrestamosModel>> obtenerPrestamosDatos() async {
    final List<PrestamosModel> listGeneral = [];

    final prestamos = await prestamosDatabase.cargarPrestamos();

    if (prestamos.length > 0) {
      for (var i = 0; i < prestamos.length; i++) {
        PrestamosModel prestamosModel = PrestamosModel();
        prestamosModel.idPrestamo = prestamos[i].idPrestamo;
        prestamosModel.cheque = prestamos[i].cheque;
        prestamosModel.fSolicitud = prestamos[i].fSolicitud;
        prestamosModel.solicitado =
            dosdecimales(double.parse(prestamos[i].solicitado ?? ''));
        prestamosModel.fAprobado = prestamos[i].fAprobado;
        prestamosModel.aprobado =
            dosdecimales(double.parse(prestamos[i].aprobado ?? ''));
        prestamosModel.girar =
            dosdecimales(double.parse(prestamos[i].girar ?? ''));
        prestamosModel.tInteres = prestamos[i].tInteres;
        prestamosModel.nCuotas = prestamos[i].nCuotas;
        prestamosModel.tipo = prestamos[i].tipo;
        prestamosModel.prioridad = prestamos[i].prioridad;
        prestamosModel.garante = prestamos[i].garante;
        prestamosModel.idPersona = prestamos[i].idPersona;
        prestamosModel.fechaActualizado = prestamos[i].fechaActualizado;

        /*double montoPagado = 0.0;
        double montoPorPagar = 0.0;
        double montoTotal = 0.0;

        double porcentajePagado = 0.0;
        double porcentajeSinPagar = 0.0;*/
        final cuotas =
            await cuotasPrestamosDatabase.obtenerCuotasPorPrestamoPorEstado(
                prestamos[i].idPrestamo ?? '', '0');
        /* if (cuotas.length > 0) {
          for (var x = 0; x < cuotas.length; x++) {
            if (cuotas[x].estadoPagado == '1') {
              montoPagado = montoPagado + double.parse(cuotas[x].cuota);
            } else {
              montoPorPagar = montoPorPagar + double.parse(cuotas[x].cuota);
            }
            montoTotal = montoTotal + double.parse(cuotas[x].cuota);
          }
        } */

        prestamosModel.montoPorPagar = cuotas[0].monto;
        /*porcentajePagado = (montoPagado*100)/montoTotal;
        porcentajeSinPagar = (montoPorPagar*100)/montoTotal;

        prestamosModel.montoPagado = dosdecimales(montoPagado);
        prestamosModel.porcentajePagado = porcentajePagado.toInt().toString();
        prestamosModel.porcentajeSinPagar = porcentajeSinPagar.toInt().toString();*/

        listGeneral.add(prestamosModel);
      }
    }

    return listGeneral;
  }
}
