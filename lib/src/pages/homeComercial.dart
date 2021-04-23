import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/pages/tabs/PrestamosTab.dart';
import 'package:secedo_unap/src/pages/tabs/PagosTab.dart';
import 'package:secedo_unap/src/pages/tabs/BeneficiariosTab.dart';
import 'package:secedo_unap/src/pages/tabs/InicioTab.dart';
import 'package:secedo_unap/src/pages/tabs/UsuarioTab.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';

class HomeComercialPage extends StatefulWidget {
  const HomeComercialPage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeComercialPage> {
  List<Widget> listPages = [];

  @override
  void initState() {
    listPages.add(InicioTab());
    listPages.add(BeneficiariosTab());
    listPages.add(PagosTab());
    listPages.add(PrestamosTab());
    listPages.add(UsuarioTab());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final buttonBloc = ProviderBloc.homeComercial(context);
    buttonBloc.changePage(2);
    final responsive = Responsive.of(context);
    return StreamBuilder(
            stream: buttonBloc.selectPageStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Scaffold(
                //FloatingActionButton( onPressed: (){},

                body: Stack(
                  children: [
                    StreamBuilder(
                      stream: buttonBloc.selectPageStream,
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
                        return IndexedStack(
                          index: snapshot.data,
                          children: listPages,
                        );
                      },
                    ),
                    Positioned(
                      bottom: responsive.hp(1),
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                          //vertical: responsive.hp(.1),
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: responsive.wp(2),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),

                          /* color: Colors.white.withOpacity(.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ], */
                        ),
                        height: responsive.hp(6.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                buttonBloc.changePage(0);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: responsive.hp(2.5),
                                    color: (buttonBloc.page == 0)
                                        ? Colors.green[600]
                                        : Colors.white60,
                                  ),
                                  Text(
                                    "Inicio",
                                    style: TextStyle(
                                      fontSize: responsive.ip(1.2),
                                      color: (buttonBloc.page == 0)
                                          ? Colors.green[600]
                                          : Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                buttonBloc.changePage(1);
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.userFriends,
                                      size: responsive.hp(2.5),

                                      //size: responsive.ip(2.7),
                                      color: (buttonBloc.page == 1)
                                          ? Colors.green[600]
                                          : Colors.white60,
                                    ),
                                    Text(
                                      "Beneficiarios",
                                      style: TextStyle(
                                        fontSize: responsive.ip(1.2),
                                        color: (buttonBloc.page == 1)
                                            ? Colors.green[600]
                                            : Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: responsive.ip(7),
                              height: responsive.ip(7),
                              transform: Matrix4.translationValues(
                                  0, -responsive.hp(3), 0),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      width: responsive.ip(7),
                                      height: responsive.ip(7),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      width: responsive.ip(6),
                                      height: responsive.ip(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.fileAlt,
                                            size: responsive.hp(2.5),
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "Pagos",
                                            style: TextStyle(
                                              fontSize: responsive.ip(1.2),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).ripple(
                                      () {
                                        print('ctv');
                                        buttonBloc.changePage(2);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            InkWell(
                              onTap: () {
                                buttonBloc.changePage(3);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.moneyBillAlt,
                                    size: responsive.hp(2.5),
                                    color: (buttonBloc.page == 3)
                                        ? Colors.green[600]
                                        : Colors.white60,
                                  ),
                                  Text(
                                    "Prestamos",
                                    style: TextStyle(
                                      fontSize: responsive.ip(1.2),
                                      color: (buttonBloc.page == 3)
                                          ? Colors.green[600]
                                          : Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                buttonBloc.changePage(4);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.verified_user_rounded,
                                    size: responsive.hp(2.5),
                                    color: (buttonBloc.page == 4)
                                        ? Colors.green[600]
                                        : Colors.white60,
                                  ),
                                  Text(
                                    "Usuario",
                                    style: TextStyle(
                                      fontSize: responsive.ip(1.2),
                                      color: (buttonBloc.page == 4)
                                          ? Colors.green[600]
                                          : Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
  }
}
