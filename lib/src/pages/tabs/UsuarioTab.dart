import 'package:flutter/material.dart';
import 'package:secedo_unap/src/utils/responsive.dart';

class UsuarioTab extends StatelessWidget {
  const UsuarioTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
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
                        padding:
                            EdgeInsets.symmetric(horizontal: responsive.wp(2)),
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
                        height: responsive.hp(13),
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
                                  _datos(responsive, 'Código:', 'AC005'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Nombre:', 'Arturo'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Apellido Paterno:',
                                      'Acosta'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(
                                      responsive, 'Apellido Materno:', 'Díaz'),
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
                        height: responsive.hp(15),
                        child: Row(
                          children: [
                            Container(
                              width: responsive.wp(2),
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
                                  _datos2(responsive, 'Dni:', '05200235'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos2(responsive, 'Cuenta del BN:',
                                      '04521409245'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos2(responsive, 'Fecha de Nacimiento:',
                                      '6/01/1961'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos2(responsive, 'Edad:', '60'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos2(responsive, 'Fecha de Afiliación:',
                                      '1/01/1990'),
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
                        height: responsive.hp(15),
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
                                      'Av del Ejercito N° 1731'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(
                                      responsive, 'Teléfono:', '04521409245'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Celular:', '978274125'),
                                  SizedBox(
                                    height: responsive.hp(.5),
                                  ),
                                  _datos(responsive, 'Correo electronico:',
                                      'artacosdi2013@gmail.com'),
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
            dato,
            style: TextStyle(
                fontSize: responsive.ip(1.6), fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
            child: Text(
          contenido,
          style: TextStyle(
              fontSize: responsive.ip(1.8), fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _datos2(Responsive responsive, String dato, String contenido) {
    return Row(
      children: [
        Container(
          width: responsive.wp(50),
          child: Text(
            dato,
            style: TextStyle(
                fontSize: responsive.ip(1.6), fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(
            contenido,
            style: TextStyle(
                fontSize: responsive.ip(1.8), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
