import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //instancia singleton para crear una sola instancia en toda la aplicación de
  //Sharedpreferences
  static final Preferences _instancia = new Preferences._internal();

  factory Preferences() {
    return _instancia;
  }

  late SharedPreferences _prefs;

  Preferences._internal();

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  clearPreferences() async {
    await _prefs.clear();
  }

  String get directorio {
    return _prefs.getString('directorio') ?? '';
  }

  set directorio(String value) {
    _prefs.setString('directorio', value);
  }

  String get idPersona {
    return _prefs.getString('idPersona') ?? '';
  }

  set idPersona(String value) {
    _prefs.setString('idPersona', value);
  }

  String get idTipoPersonaDtipoPersona {
    return _prefs.getString('idTipoPersonaDtipoPersona') ?? '';
  }

  set idTipoPersonaDtipoPersona(String value) {
    _prefs.setString('idTipoPersonaDtipoPersona', value);
  }

  String get idFacultadDfacultad {
    return _prefs.getString('idFacultadDfacultad') ?? '';
  }

  set idFacultadDfacultad(String value) {
    _prefs.setString('idFacultadDfacultad', value);
  }

  String get codigo {
    return _prefs.getString('codigo') ?? '';
  }

  set codigo(String value) {
    _prefs.setString('codigo', value);
  }

  String get nombrePersona {
    return _prefs.getString('nombrePersona') ?? '';
  }

  set nombrePersona(String value) {
    _prefs.setString('nombrePersona', value);
  }

  String get apellidoPaterno {
    return _prefs.getString('apellidoPaterno') ?? '';
  }

  set apellidoPaterno(String value) {
    _prefs.setString('apellidoPaterno', value);
  }

  String get apellidoMaterno {
    return _prefs.getString('apellidoMaterno') ?? '';
  }

  set apellidoMaterno(String value) {
    _prefs.setString('apellidoMaterno', value);
  }

  String get direccion {
    return _prefs.getString('direccion') ?? '';
  }

  set direccion(String value) {
    _prefs.setString('direccion', value);
  }

  String get telefono {
    return _prefs.getString('telefono') ?? '';
  }

  set telefono(String value) {
    _prefs.setString('telefono', value);
  }

  String get celular {
    return _prefs.getString('celular') ?? '';
  }

  set celular(String value) {
    _prefs.setString('celular', value);
  }

  String get correo {
    return _prefs.getString('correo') ?? '';
  }

  set correo(String value) {
    _prefs.setString('correo', value);
  }

  String get imagen {
    return _prefs.getString('imagen') ?? '';
  }

  set imagen(String value) {
    _prefs.setString('imagen', value);
  }

  String get nvecesPersona {
    return _prefs.getString('nvecesPersona') ?? '';
  }

  set nvecesPersona(String value) {
    _prefs.setString('nvecesPersona', value);
  }

  String get fechaNombramiento {
    return _prefs.getString('fechaNombramiento') ?? '';
  }

  set fechaNombramiento(String value) {
    _prefs.setString('fechaNombramiento', value);
  }

  String get dni {
    return _prefs.getString('dni') ?? '';
  }

  set dni(String value) {
    _prefs.setString('dni', value);
  }

  String get cuentaBN {
    return _prefs.getString('cuentaBN') ?? '';
  }

  set cuentaBN(String value) {
    _prefs.setString('cuentaBN', value);
  }

  String get fechaNac {
    return _prefs.getString('fechaNac') ?? '';
  }

  set fechaNac(String value) {
    _prefs.setString('fechaNac', value);
  }

  String get tipoPersona {
    return _prefs.getString('tipoPersona') ?? '';
  }

  set tipoPersona(String value) {
    _prefs.setString('tipoPersona', value);
  }

  String get tipoAfiliado {
    return _prefs.getString('tipoAfiliado') ?? '';
  }

  set tipoAfiliado(String value) {
    _prefs.setString('tipoAfiliado', value);
  }

  String get facultad {
    return _prefs.getString('facultad') ?? '';
  }

  set facultad(String value) {
    _prefs.setString('facultad', value);
  }

  String get idAfiliacion {
    return _prefs.getString('idAfiliacion') ?? '';
  }

  set idAfiliacion(String value) {
    _prefs.setString('idAfiliacion', value);
  }

  String get idPersonaDpersona {
    return _prefs.getString('idPersonaDpersona') ?? '';
  }

  set idPersonaDpersona(String value) {
    _prefs.setString('idPersonaDpersona', value);
  }

  String get fechaAfiliacion {
    return _prefs.getString('fechaAfiliacion') ?? '';
  }

  set fechaAfiliacion(String value) {
    _prefs.setString('fechaAfiliacion', value);
  }

  String get fechaCesantia {
    return _prefs.getString('fechaCesantia') ?? '';
  }

  set fechaCesantia(String value) {
    _prefs.setString('fechaCesantia', value);
  }

  String get nveces {
    return _prefs.getString('nveces') ?? '';
  }

  set nveces(String value) {
    _prefs.setString('nveces', value);
  }

  String get fechaDesafiliacion {
    return _prefs.getString('fechaDesafiliacion') ?? '';
  }

  set fechaDesafiliacion(String value) {
    _prefs.setString('fechaDesafiliacion', value);
  }

  String get yearAfiliacion {
    return _prefs.getString('yearAfiliacion') ?? '';
  }

  set yearAfiliacion(String value) {
    _prefs.setString('yearAfiliacion', value);
  }

  String get mesAfiliacion {
    return _prefs.getString('mesAfiliacion') ?? '';
  }

  set mesAfiliacion(String value) {
    _prefs.setString('mesAfiliacion', value);
  }

  String get diaAfiliacion {
    return _prefs.getString('diaAfiliacion') ?? '';
  }

  set diaAfiliacion(String value) {
    _prefs.setString('diaAfiliacion', value);
  }

  String get yearNacimiento {
    return _prefs.getString('yearNacimiento') ?? '';
  }

  set yearNacimiento(String value) {
    _prefs.setString('yearNacimiento', value);
  }

  String get accessToken {
    return _prefs.getString('accessToken') ?? '';
  }

  set accessToken(String value) {
    _prefs.setString('accessToken', value);
  }

  String get tokenType {
    return _prefs.getString('tokenType') ?? '';
  }

  set tokenType(String value) {
    _prefs.setString('tokenType', value);
  }
}
