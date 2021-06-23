import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/beneficiarios_bloc.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/responsive.dart';

class BeneficiariosTab extends StatefulWidget {
  const BeneficiariosTab({Key key}) : super(key: key);

  @override
  _BeneficiariosTabState createState() => _BeneficiariosTabState();
}

class _BeneficiariosTabState extends State<BeneficiariosTab> {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final preferences = Preferences();
    final beneficiariosBloc = ProviderBloc.beneficiarios(context);
    beneficiariosBloc.obtenerBeneficiariosPorIdPersona(preferences.idPersona);

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
                    StreamBuilder(
                        stream: beneficiariosBloc.beneficiariosControllerStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<BeneficiariosGeneral>>
                                snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.length > 0) {
                              return Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemCount: snapshot.data.length + 2,
                                    itemBuilder: (_, index1) {
                                      if (index1 == snapshot.data.length + 1) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: responsive.hp(2),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: responsive.wp(2),
                                                  ),
                                                  Container(
                                                    height: responsive.ip(4),
                                                    width: responsive.ip(4),
                                                    child: Stack(
                                                      children: [
                                                       
                                                        
                                                        Center(
                                                          child: Icon(Icons.add_alert_sharp,color: Colors.red,),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: responsive.wp(2),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      '${snapshot.data[0].beneficiarios[0].observacion} ',
                                                      style: TextStyle(
                                                          fontSize: responsive
                                                              .ip(1.8),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: responsive.wp(2),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: responsive.hp(8),
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                      if (index1 == snapshot.data.length) {
                                        return Container(
                                          height: responsive.hp(2),
                                        );
                                      }

                                      return ListView.builder(
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          itemCount: snapshot.data[index1]
                                                  .beneficiarios.length +
                                              1,
                                          itemBuilder: (_, index2) {
                                            if (index2 == 0) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: responsive.wp(3),
                                                  vertical: responsive.hp(1.5),
                                                ),
                                                child: Text(
                                                  '${snapshot.data[index1].texto}',
                                                  style: TextStyle(
                                                    fontSize:
                                                        responsive.ip(1.8),
                                                  ),
                                                ),
                                              );
                                            }

                                            final letras = Random().nextInt(
                                                Colors.primaries.length);
                                            return Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: responsive.wp(3),
                                                  vertical: responsive.hp(.8)),
                                              padding: EdgeInsets.only(
                                                  right: responsive.wp(2)),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.4),
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
                                                      color: Colors
                                                          .primaries[letras],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${snapshot.data[index1].beneficiarios[index2 - 1].nombre} ',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: responsive
                                                                .ip(1.7),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              responsive.hp(.5),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      responsive
                                                                          .wp(
                                                                              2),
                                                                  vertical:
                                                                      responsive
                                                                          .hp(.5)),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                          .primaries[
                                                                      letras],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15)),
                                                              child: Text(
                                                                '${snapshot.data[index1].beneficiarios[index2 - 1].parentesco} ',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        responsive.ip(
                                                                            1.5),
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            (snapshot.data[index1]
                                                                        .tipo ==
                                                                    '1')
                                                                ? Text(
                                                                    'Porcentaje : ',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          responsive
                                                                              .ip(1.6),
                                                                    ),
                                                                  )
                                                                : Container(),
                                                            (snapshot.data[index1]
                                                                        .tipo ==
                                                                    '1')
                                                                ? Text(
                                                                    '${snapshot.data[index1].beneficiarios[index2 - 1].porcentaje}%',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          responsive
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
                                          },);
                                    },),
                              );
                            } else {
                              return Center(
                                child: Text('No existen beneficiarios'),
                              );
                            }
                          } else {
                            return Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                        }),
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
