










import 'package:rxdart/subjects.dart';
import 'package:secedo_unap/src/api/cuotas_prestamo_api.dart';
import 'package:secedo_unap/src/database/cuotas_prestamos_database.dart';
import 'package:secedo_unap/src/model/cuotas_prestamos_model.dart';

class CuotasPrestamosBloc{

  final cuotasPrestamosDatabase = CuotasPrestamosDatabase();
  final cuotasPrestamosApi = CuotasPrestamosApi();
  

  final _cuotasPrestamosController  = BehaviorSubject<List<CuotasPrestamosModel>>();

  Stream<List<CuotasPrestamosModel>> get cuotasPrestamosStream => _cuotasPrestamosController.stream;

  dispose(){
    _cuotasPrestamosController?.close();
  }
  void obtenerPrestamos(String idPrestamo)async{
    _cuotasPrestamosController.sink.add(await cuotasPrestamosDatabase.obtenerCuotasPorPrestamo(idPrestamo));
    await cuotasPrestamosApi.obtenerCuotasPrestamos(idPrestamo);
    _cuotasPrestamosController.sink.add(await cuotasPrestamosDatabase.obtenerCuotasPorPrestamo(idPrestamo));

  }



}