import 'package:flutter/material.dart';

import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/pages/homeComercial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderBloc(
      child: MaterialApp(
          title: 'Secedo Unap',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeComercialPage(),
          routes: {
            //"login": (BuildContext context) => LoginPage(),

            // "inicioFundo": (BuildContext context) => InicioFundoPage(),
          }),
    );
  }
}
