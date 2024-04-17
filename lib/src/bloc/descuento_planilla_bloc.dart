import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/descuento_planilla_api.dart';
import 'package:secedo_unap/src/database/descuento_planilla_database.dart';
import 'package:secedo_unap/src/model/descuento_planilla_model.dart';

class DescuentoPlanillaBloc {
  final descuentoPlanillaDatabase = DescuentoPlanillaDatabase();
  final descuentoPlanillaApi = DescuentoPlanillaApi();

  final _descuentoPlanillaController =
      BehaviorSubject<List<DescuentoPlanillaModel>>();

  Stream<List<DescuentoPlanillaModel>> get descuentoPlanillaControllerStream =>
      _descuentoPlanillaController.stream;

  dispose() {
    _descuentoPlanillaController.close();
  }

  void obtenerDescuentoPlanilla() async {
    _descuentoPlanillaController.sink.add(await planillitas());
    await descuentoPlanillaApi.obtenerDescuentoPlanilla();
    _descuentoPlanillaController.sink.add(await planillitas());
  }

  Future<List<DescuentoPlanillaModel>> planillitas() async {
    final List<DescuentoPlanillaModel> listGeneral = [];

    final descuentos =
        await descuentoPlanillaDatabase.cargarDescuentosPlanillas();

    if (descuentos.length > 0) {
      if (descuentos.length > 4) {
        for (var i = 0; i < 5; i++) {
          DescuentoPlanillaModel descuentoPlanillaModel =
              DescuentoPlanillaModel();

          descuentoPlanillaModel.idDescuentoPlanilla =
              descuentos[i].idDescuentoPlanilla;
          descuentoPlanillaModel.idAfiliacion = descuentos[i].idAfiliacion;
          descuentoPlanillaModel.codigo = descuentos[i].codigo;
          descuentoPlanillaModel.nombre = descuentos[i].nombre;
          descuentoPlanillaModel.fecha = descuentos[i].fecha;
          descuentoPlanillaModel.cesantia = descuentos[i].cesantia;
          descuentoPlanillaModel.funeral = descuentos[i].funeral;
          descuentoPlanillaModel.jubilacion = descuentos[i].jubilacion;
          descuentoPlanillaModel.otros = descuentos[i].otros;
          descuentoPlanillaModel.multa = descuentos[i].multa;
          descuentoPlanillaModel.apr = descuentos[i].apr;
          descuentoPlanillaModel.garantizado = descuentos[i].garantizado;
          descuentoPlanillaModel.descuento = descuentos[i].descuento;
          descuentoPlanillaModel.ntotal = descuentos[i].ntotal;
          descuentoPlanillaModel.aplicado = descuentos[i].aplicado;
          descuentoPlanillaModel.diferencia = descuentos[i].diferencia;
          descuentoPlanillaModel.idPersona = descuentos[i].idPersona;
          descuentoPlanillaModel.posicion = descuentos[i].posicion;

          listGeneral.add(descuentoPlanillaModel);
        }
      } else {
        for (var i = 0; i < descuentos.length; i++) {
          DescuentoPlanillaModel descuentoPlanillaModel =
              DescuentoPlanillaModel();

          descuentoPlanillaModel.idDescuentoPlanilla =
              descuentos[i].idDescuentoPlanilla;
          descuentoPlanillaModel.idAfiliacion = descuentos[i].idAfiliacion;
          descuentoPlanillaModel.codigo = descuentos[i].codigo;
          descuentoPlanillaModel.nombre = descuentos[i].nombre;
          descuentoPlanillaModel.fecha = descuentos[i].fecha;
          descuentoPlanillaModel.cesantia = descuentos[i].cesantia;
          descuentoPlanillaModel.funeral = descuentos[i].funeral;
          descuentoPlanillaModel.jubilacion = descuentos[i].jubilacion;
          descuentoPlanillaModel.otros = descuentos[i].otros;
          descuentoPlanillaModel.multa = descuentos[i].multa;
          descuentoPlanillaModel.apr = descuentos[i].apr;
          descuentoPlanillaModel.garantizado = descuentos[i].garantizado;
          descuentoPlanillaModel.descuento = descuentos[i].descuento;
          descuentoPlanillaModel.ntotal = descuentos[i].ntotal;
          descuentoPlanillaModel.aplicado = descuentos[i].aplicado;
          descuentoPlanillaModel.diferencia = descuentos[i].diferencia;
          descuentoPlanillaModel.idPersona = descuentos[i].idPersona;
          descuentoPlanillaModel.posicion = descuentos[i].posicion;

          listGeneral.add(descuentoPlanillaModel);
        }
      }
    }

    return listGeneral;
  }
}
