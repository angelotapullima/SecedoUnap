

import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/home_comercial_bloc.dart';
import 'package:secedo_unap/src/bloc/prestamos_item_bloc.dart';

class ProviderBloc extends InheritedWidget {
  static ProviderBloc _instancia;


  final homeComercialBloc = HomeComercialBloc();
  final prestamosItemBloc = PrestamosItemBloc();
  
  

  factory ProviderBloc({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new ProviderBloc._internal(key: key, child: child);
    }

    return _instancia;
  }

  ProviderBloc._internal({Key key, Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(ProviderBloc oldWidget) => true;



  //tab
  static HomeComercialBloc homeComercial(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())
        .homeComercialBloc;
  }
  //tab
  static PrestamosItemBloc presta(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())
        .prestamosItemBloc;
  }

}
