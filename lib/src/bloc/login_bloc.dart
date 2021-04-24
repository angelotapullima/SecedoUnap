
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:secedo_unap/src/api/login_api.dart';

class LoginBloc with Validators {

  final loginProviders = LoginApi();

final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _cargandoLoginController = new BehaviorSubject<bool>();

  //Recuperaer los datos del Stream
  Stream<String> get emailStream =>_emailController.stream.transform(validarname);
  Stream<String> get passwordStream =>_passwordController.stream.transform(validarPassword);
  Stream<bool> get cargando => _cargandoLoginController.stream;

  Stream<bool> get formValidStream =>Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //inserta valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(bool) get changeCargando => _cargandoLoginController.sink.add;

  //obtener el ultimo valor ingresado a los stream
  String get email => _emailController.value;
  String get password => _passwordController.value;



  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _cargandoLoginController?.close();
  }

  
  Future<int> login(String user, String pass) async {
    _cargandoLoginController.sink.add(true);
    final resp = await loginProviders.login(email, pass);
    _cargandoLoginController.sink.add(false);

    return resp;
  }

}

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 0) {
      sink.add(password);
    } else {
      sink.addError('El campo passWord no debe estar vacio');
    }
  });

  final validarname =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 0) {
      sink.add(name);
    } else {
      sink.addError('Este campo no debe estar vacio');
    }
  });
 
}
