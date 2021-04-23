import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/beneficiarios_bloc.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
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

    final beneficiariosBloc = ProviderBloc.beneficiarios(context);
    beneficiariosBloc.obtenerBeneficiarios();

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
                child: StreamBuilder(
                  stream: beneficiariosBloc.beneficiariosControllerStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<BeneficiariosList>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        return ListView(
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
                            (snapshot.data[0].funeral.length > 0)
                                ? ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    itemCount:
                                        snapshot.data[0].funeral.length + 1,
                                    shrinkWrap: true,
                                    itemBuilder: (context, indexFune) {
                                      final letras = Random()
                                          .nextInt(Colors.primaries.length);

                                      if (indexFune == 0) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: responsive.wp(3),
                                              vertical: responsive.hp(1)),
                                          child: Text(
                                            'Beneficiarios con derecho a fondo de cesantía y bolsa de jubilación',
                                            style: TextStyle(
                                                fontSize: responsive.ip(2)),
                                          ),
                                        );
                                      }

                                      int indexFuneral = indexFune - 1;

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
                                              color:
                                                  Colors.grey.withOpacity(0.4),
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
                                                    '${snapshot.data[0].funeral[indexFuneral].nombre}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          responsive.ip(1.7),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: responsive.hp(.5),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              responsive.wp(2),
                                                          vertical:
                                                              responsive.hp(.5),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.primaries[
                                                                  letras],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Text(
                                                          '${snapshot.data[0].funeral[indexFuneral].gradoParentesco}',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  responsive
                                                                      .ip(1.5),
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Text(
                                                        'Porcentaje : ',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: responsive
                                                              .ip(1.6),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${snapshot.data[0].funeral[indexFuneral].porcentaje}%',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: responsive
                                                              .ip(1.6),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : Container(),
                            (snapshot.data[0].fallecido.length > 0)
                                ? ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    itemCount:
                                        snapshot.data[0].fallecido.length + 1,
                                    shrinkWrap: true,
                                    itemBuilder: (context, indexFalle) {
                                      final letras = Random()
                                          .nextInt(Colors.primaries.length);

                                      if (indexFalle == 0) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: responsive.wp(3),
                                              vertical: responsive.hp(1)),
                                          child: Text(
                                            'Beneficiarios con derecho a fondo de cesantía y bolsa de jubilación',
                                            style: TextStyle(
                                                fontSize: responsive.ip(2)),
                                          ),
                                        );
                                      }

                                      int indexFallecido = indexFalle - 1;

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
                                              color:
                                                  Colors.grey.withOpacity(0.4),
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
                                                    '${snapshot.data[0].fallecido[indexFallecido].nombre}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          responsive.ip(1.7),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: responsive.hp(.5),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              responsive.wp(2),
                                                          vertical:
                                                              responsive.hp(.5),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.primaries[
                                                                  letras],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Text(
                                                          '${snapshot.data[0].fallecido[indexFallecido].gradoParentesco}',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  responsive
                                                                      .ip(1.5),
                                                              color:
                                                                  Colors.white),
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
                                      );
                                    },
                                  )
                                : Container(),
                            (snapshot.data[0].beneficioFallecido.length > 0)
                                ? ListView.builder(
                                    itemCount:
                                        snapshot.data[0].funeral.length + 1,
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (context, indexFune) {
                                      final letras = Random()
                                          .nextInt(Colors.primaries.length);

                                      if (indexFune == 0) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: responsive.wp(3),
                                              vertical: responsive.hp(1)),
                                          child: Text(
                                            ' A mi fallecimiento el fondo de funerales debe ingresarse a:',
                                            style: TextStyle(
                                              fontSize: responsive.ip(2),
                                            ),
                                          ),
                                        );
                                      }

                                      int indexFuneral = indexFune - 1;

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
                                              color:
                                                  Colors.grey.withOpacity(0.4),
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
                                                    '${snapshot.data[0].funeral[indexFuneral].nombre}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          responsive.ip(1.7),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: responsive.hp(.5),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              responsive.wp(2),
                                                          vertical:
                                                              responsive.hp(.5),
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.primaries[
                                                                  letras],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Text(
                                                          '${snapshot.data[0].funeral[indexFuneral].gradoParentesco}',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  responsive
                                                                      .ip(1.5),
                                                              color:
                                                                  Colors.white),
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
                                      );
                                    },
                                  )
                                : Container(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.wp(3),
                                vertical: responsive.hp(1),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.add_alert_sharp,color: Colors.red,),
                                  SizedBox(
                                    width: responsive.wp(3),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${snapshot.data[0].funeral[0].observaciones}',
                                      style: TextStyle(
                                          fontSize: responsive.ip(2),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      } else {
                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                    } else {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
