import 'dart:math';

import 'package:flutter/material.dart';
import 'package:secedo_unap/src/utils/responsive.dart';

class BeneficiariosTab extends StatefulWidget {
  const BeneficiariosTab({Key key}) : super(key: key);

  @override
  _BeneficiariosTabState createState() => _BeneficiariosTabState();
}

class _BeneficiariosTabState extends State<BeneficiariosTab> {
  var list = [
    BeneficiariosGeneral(
      tipo: '1',
      texto:
          'Beneficiarios con derecho a fondo de cesantía y bolsa de jubilación',
      beneficiarios: [
        Beneficiarios(
            porcentaje: '100%',
            nombre: 'Martha Jacqueline Vigo Rodriguez',
            parentesco: 'Esposa')
      ],
    ),
    BeneficiariosGeneral(
      tipo: '2',
      texto: 'Derecho como afiliado al cobro de fondos de funerales',
      beneficiarios: [
        Beneficiarios(
            porcentaje: '100%',
            nombre: 'Martha Jacqueline Vigo Rodriguez',
            parentesco: 'Esposa'),
        Beneficiarios(
            porcentaje: '100%',
            nombre: 'Benedicto Acosta Vela',
            parentesco: 'Padre'),
        Beneficiarios(
            porcentaje: '100%',
            nombre: 'Manuel Arturo Acosta Vigo',
            parentesco: 'Hijo'),
       
      ],
    ),
  ];

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
              color: Colors.white,
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.wp(3),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Beneficiarios',
                            style: TextStyle(
                                fontSize: responsive.ip(3),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: responsive.hp(2),
                    ),
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: list.length + 1,
                          itemBuilder: (_, index1) {
                            if (index1 == list.length) {

                              final letras =
                                      Random().nextInt(Colors.primaries.length);


                              return Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: responsive.wp(3),
                                        vertical: responsive.hp(1.5),
                                      ),
                                      child: Text(
                                        'A mi Fallecimientoel fondo de funerales debe ingresarse a : ',
                                        style: TextStyle(
                                          fontSize: responsive.ip(1.8),
                                        ),
                                      ),
                                    ),
                                    Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: responsive.wp(3),
                                        vertical: responsive.hp(.8)),
                                    padding: EdgeInsets.only(
                                        right: responsive.wp(2)),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.primaries[letras],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: responsive.wp(2),
                                          height: responsive.hp(7),
                                        ),
                                        SizedBox(
                                          width: responsive.wp(2),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Martha Jacqueline Vigo Rodriguez',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: responsive.ip(1.8),
                                                ),
                                              ),
                                              SizedBox(
                                                height: responsive.hp(.5),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                responsive
                                                                    .wp(2),
                                                            vertical: responsive
                                                                .hp(.5)),
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .primaries[letras],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Text(
                                                      'Esposa ',
                                                      style: TextStyle(
                                                          fontSize: responsive
                                                              .ip(1.6),
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                
                                ],
                              );
                            }

                            return ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount:
                                    list[index1].beneficiarios.length + 1,
                                itemBuilder: (_, index2) {
                                  if (index2 == 0) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: responsive.wp(3),
                                        vertical: responsive.hp(1.5),
                                      ),
                                      child: Text(
                                        '${list[index1].texto}',
                                        style: TextStyle(
                                          fontSize: responsive.ip(1.8),
                                        ),
                                      ),
                                    );
                                  }
                                  
                                    final letras =
                                      Random().nextInt(Colors.primaries.length);
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: responsive.wp(3),
                                        vertical: responsive.hp(.8)),
                                    padding: EdgeInsets.only(
                                        right: responsive.wp(2)),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.primaries[letras],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: responsive.wp(2),
                                          height: responsive.hp(7),
                                        ),
                                        SizedBox(
                                          width: responsive.wp(2),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${list[index1].beneficiarios[index2 - 1].nombre} ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: responsive.ip(1.8),
                                                ),
                                              ),
                                              SizedBox(
                                                height: responsive.hp(.5),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                responsive
                                                                    .wp(2),
                                                            vertical: responsive
                                                                .hp(.5)),
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .primaries[letras],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: Text(
                                                      '${list[index1].beneficiarios[index2 - 1].parentesco} ',
                                                      style: TextStyle(
                                                          fontSize: responsive
                                                              .ip(1.6),
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  (list[index1].tipo == '1')
                                                      ? Text(
                                                          'Porcentaje : ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: responsive
                                                                .ip(1.6),
                                                          ),
                                                        )
                                                      : Container(),
                                                  (list[index1].tipo == '1')
                                                      ? Text(
                                                          '100%',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: responsive
                                                                .ip(1.6),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BeneficiariosGeneral {
  String tipo;
  String texto;
  List<Beneficiarios> beneficiarios;

  BeneficiariosGeneral({this.tipo, this.beneficiarios, this.texto});
}

class Beneficiarios {
  Beneficiarios({this.porcentaje, this.nombre, this.parentesco});

  String porcentaje;
  String nombre;
  String parentesco;
}
