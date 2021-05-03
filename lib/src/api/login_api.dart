import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:secedo_unap/src/api/afiliados_api.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/constants.dart';

class LoginApi {
  final prefs = new Preferences();
  final afiliadosApi = AfiliadosApi();

  Future<bool> login(String user, String pass) async {
    String accessToken = '';
    String tokenType = '';
    try {
      final url = '$apiBaseURL/token';

      final resp = await http.post(url, headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }, body: {
        'grant_type': 'password',
        'username': '$user',
        'password': '$pass',
      });

      final decodedData = json.decode(resp.body);

      accessToken = decodedData['access_token'];
      tokenType = decodedData['token_type'];

      if (accessToken.length > 0) {
        final code = await token(accessToken, tokenType);
        return code;
      } else {
        return false;
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> token(String accessToken, String tokenType) async {
    try {
      final url = '$apiBaseURL/api/Values';

      final resp = await http.get(url, headers: {
        'Authorization': '$tokenType $accessToken'
      } /* , body: {
        'grant_type': 'password',
        'username': '05223782',
        'password': '05223782DA026',
      } */
          );

      final decodedData = json.decode(resp.body);
      print(decodedData[4]);

      final respuesta = await afiliadosApi.obtenerAfiliadosDni(decodedData[4]);
      print(respuesta);

      return respuesta;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }
}
