
import 'package:rxdart/subjects.dart';

class PrestamosItemBloc {
  //instancia que captura el ultimo elemento agregado al controlador
  final selectTab = BehaviorSubject<int>();

  Stream<int> get prestamosItemStream => selectTab.stream;

  Function(int) get changePrestamosItem => selectTab.sink.add;

  int get prestamosItem => selectTab.value;

  dispose() {
    selectTab?.close();
  }
}
