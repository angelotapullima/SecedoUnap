

















import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/descuento_planilla_api.dart';
import 'package:secedo_unap/src/database/descuento_planilla_database.dart';
import 'package:secedo_unap/src/model/descuento_planilla_model.dart';

class DescuentoPlanillaBloc{

  final descuentoPlanillaDatabase = DescuentoPlanillaDatabase();
  final descuentoPlanillaApi = DescuentoPlanillaApi();
  

  final _descuentoPlanillaController  = BehaviorSubject<List<DescuentoPlanillaModel>>();

  Stream<List<DescuentoPlanillaModel>> get descuentoPlanillaControllerStream => _descuentoPlanillaController.stream;

  dispose(){
    _descuentoPlanillaController?.close();
  }
  void obtenerDescuentoPlanilla()async{
    _descuentoPlanillaController.sink.add(await descuentoPlanillaDatabase.cargarDescuentosPlanillas());
    await descuentoPlanillaApi.obtenerDescuentoPlanilla();
    _descuentoPlanillaController.sink.add(await descuentoPlanillaDatabase.cargarDescuentosPlanillas());

  }

  



}