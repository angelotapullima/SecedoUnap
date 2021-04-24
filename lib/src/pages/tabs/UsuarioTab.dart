import 'package:flutter/material.dart';
import 'package:secedo_unap/src/database/beneficiarios_database.dart';
import 'package:secedo_unap/src/database/cuotas_prestamos_database.dart';
import 'package:secedo_unap/src/database/descuento_planilla_database.dart';
import 'package:secedo_unap/src/database/planilla_enviada_database.dart';
import 'package:secedo_unap/src/database/prestamos_database.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/responsive.dart';

class UsuarioTab extends StatelessWidget {
  const UsuarioTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final preferences = Preferences();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: responsive.hp(50),
              color: Colors.black,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Container(
              height: responsive.hp(92.5),
              color: Color(0xFFF6F7F8), //Colors.grey[100],
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                        ),
                        child: Text(
                          'Datos Personales',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(3),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                          vertical: responsive.hp(1),
                        ),
                        /* padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                          vertical: responsive.hp(1),
                        ), */
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.12),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: responsive.hp(15),
                        child: Row(
                          children: [
                            Container(
                              width: responsive.wp(2),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Código:',
                                      '${preferences.codigo}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Nombre:',
                                      '${preferences.nombrePersona}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Apellido Paterno:',
                                      '${preferences.apellidoPaterno}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Apellido Materno:',
                                      '${preferences.apellidoMaterno}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                          vertical: responsive.hp(1),
                        ),
                        /*  padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                          vertical: responsive.hp(1),
                        ), */
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.12),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: responsive.hp(18),
                        child: Row(
                          children: [
                            Container(
                              width: responsive.wp(2),
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  _datos2(
                                      responsive, 'Dni:', '${preferences.dni}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos2(responsive, 'Cuenta del BN:',
                                      '${preferences.cuentaBN}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos2(responsive, 'Fecha de Nacimiento:',
                                      '${preferences.fechaNac}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos2(responsive, 'Edad:',
                                      '${preferences.codigo}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos2(responsive, 'Fecha de Afiliación:',
                                      '${preferences.fechaAfiliacion}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                          vertical: responsive.hp(1),
                        ),
                        /*  padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                          vertical: responsive.hp(1),
                        ), */
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.12),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: responsive.hp(18),
                        child: Row(
                          children: [
                            Container(
                              width: responsive.wp(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              width: responsive.wp(2),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  _datos(responsive, 'Dirección:',
                                      '${preferences.direccion}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Teléfono:',
                                      '${preferences.telefono}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Celular:',
                                      '${preferences.celular}'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Correo electronico:',
                                      '${preferences.correo}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: responsive.wp(3)),
                        child: Text(
                          'Tiempo de Afiliación',
                          style: TextStyle(
                              fontSize: responsive.ip(2),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: responsive.wp(2)),
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(3),
                          vertical: responsive.hp(.5),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff2ea2e8),
                        ),
                        child: Text(
                          '30 años , 5 meses y 22 días ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsive.ip(2.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: responsive.hp(2),
                          left: responsive.wp(6),
                          right: responsive.wp(6),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.all(0.0),
                            child: Text('Cerrar Sesión'),
                            color: Color(0xFFF93963),
                            textColor: Colors.white,
                            onPressed: () async {
                              final preferences = Preferences();
                              preferences.clearPreferences();
                              final beneficiariosDatabase =
                                  BeneficiariosDatabase();
                              final cuotasPrestamosDatabase =
                                  CuotasPrestamosDatabase();
                              final descuentoPlanillaDatabase =
                                  DescuentoPlanillaDatabase();
                              final planillaEnviadaDatabase =
                                  PlanillaEnviadaDatabase();
                              final prestamosDatabase = PrestamosDatabase();

                              await beneficiariosDatabase.deleteBeneficiarios();
                              await cuotasPrestamosDatabase
                                  .deleteCuotasPrestamos();
                              await descuentoPlanillaDatabase
                                  .deleteDescuentoPlanilla();
                              await planillaEnviadaDatabase
                                  .deletePlanillaEnviada();
                              await prestamosDatabase.deletePrestamos();

                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  'login', (Route<dynamic> route) => false);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _datos(Responsive responsive, String dato, String contenido) {
    return Row(
      children: [
        Container(
          width: responsive.wp(40),
          child: Text(
            ('$dato' == 'null') ? '-' : '$dato',
            style: TextStyle(
                fontSize: responsive.ip(1.6), fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(
              ('$contenido' == 'null') ? '-' : '$contenido',
            style: TextStyle(
                fontSize: responsive.ip(1.8), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _datos2(Responsive responsive, String dato, String contenido) {
    return Row(
      children: [
        Container(
          width: responsive.wp(50),
          child: Text(
            ('$dato' == 'null') ? '-' : '$dato',
            style: TextStyle(
                fontSize: responsive.ip(1.6), fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(
              ('$contenido' == 'null') ? '-' : '$contenido',
            style: TextStyle(
                fontSize: responsive.ip(1.8), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
