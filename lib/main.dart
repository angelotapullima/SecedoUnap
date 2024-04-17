import 'package:flutter/material.dart';

import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/pages/homeComercial.dart';
import 'package:secedo_unap/src/pages/login_page.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new Preferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final prefs = Preferences();
    return ProviderBloc(
      child: MaterialApp(
          title: 'Secedo Unap',
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(
                  textScaleFactor:
                      data.textScaleFactor > 2.0 ? 1.2 : data.textScaleFactor),
              child: child ?? Container(),
            );
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: (prefs.idPersona == "" || prefs.idPersona == null)
              ? 'login'
              : 'home',
          routes: {
            "home": (BuildContext context) => HomeComercialPage(),
            "login": (BuildContext context) => LoginPage(),

            // "inicioFundo": (BuildContext context) => InicioFundoPage(),
          }),
    );
  }
}
