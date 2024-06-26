import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/afiliados_bloc.dart';
import 'package:secedo_unap/src/bloc/beneficiarios_bloc.dart';
import 'package:secedo_unap/src/bloc/cuotas_prestamos_bloc.dart';
import 'package:secedo_unap/src/bloc/descuento_planilla_bloc.dart';
import 'package:secedo_unap/src/bloc/deudas_bloc.dart';
import 'package:secedo_unap/src/bloc/home_comercial_bloc.dart';
import 'package:secedo_unap/src/bloc/login_bloc.dart';
import 'package:secedo_unap/src/bloc/planilla_enviada_bloc.dart';
import 'package:secedo_unap/src/bloc/prestamos_bloc.dart';
import 'package:secedo_unap/src/bloc/prestamos_item_bloc.dart';

class ProviderBloc extends InheritedWidget {
  final homeComercialBloc = HomeComercialBloc();
  final prestamosItemBloc = PrestamosItemBloc();

  final prestasmosBloc = PrestamosBloc();
  final cuotasPrestamosBloc = CuotasPrestamosBloc();
  final descuentoPlanillaBloc = DescuentoPlanillaBloc();
  final beneficiariosBloc = BeneficiariosBloc();
  final planillaEnviadaBloc = PlanillaEnviadaBloc();
  final loginBloc = LoginBloc();
  final afiliadosBloc = AfiliadosBloc();
  final deudasBloc = DeudasBloc();

  ProviderBloc({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(ProviderBloc oldWidget) => true;

  //tab
  static HomeComercialBloc homeComercial(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .homeComercialBloc;
  }

  //tab
  static PrestamosItemBloc presta(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .prestamosItemBloc;
  }

  //tab
  static PrestamosBloc prestamos(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .prestasmosBloc;
  }

  //tab
  static CuotasPrestamosBloc cuotasP(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .cuotasPrestamosBloc;
  }

  //tab
  static DescuentoPlanillaBloc descuentoP(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .descuentoPlanillaBloc;
  }

  //tab
  static BeneficiariosBloc beneficiarios(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .beneficiariosBloc;
  }

  //tab
  static PlanillaEnviadaBloc planillaEnviada(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .planillaEnviadaBloc;
  }

  static LoginBloc login(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .loginBloc;
  }

  static AfiliadosBloc afiliados(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .afiliadosBloc;
  }

  static DeudasBloc deudas(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>())!
        .deudasBloc;
  }
}
