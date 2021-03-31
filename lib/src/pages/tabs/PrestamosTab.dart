import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/pages/details_prestamos.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';

class PrestamosTab extends StatelessWidget {
  const PrestamosTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final prestamosItemBloc = ProviderBloc.presta(context);
    prestamosItemBloc.changePrestamosItem(0);

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
              color: Color(0xFFF6F7F8),
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
                            'Préstamos',
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
                    Container(
                      height: responsive.hp(26.5),
                      child: SafeArea(
                          child: PromocionesInicio(
                        responsive: responsive,
                      )),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.wp(3),
                            vertical: responsive.hp(2),
                          ),
                          child: StreamBuilder(
                            stream: prestamosItemBloc.prestamosItemStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              return (snapshot.data == 0)
                                  ? SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _datosRow(
                                              responsive,
                                              'Codigo:',
                                              'AC005',
                                              'N° de Cheque:',
                                              '84810411'),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow(
                                              responsive,
                                              'Nombre:',
                                              'Acosta Diaz, Arturo',
                                              'Prioridad:',
                                              'Emergencia'),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow(
                                              responsive,
                                              'Tipo:',
                                              'Ampliación',
                                              'Tasa De Interes:',
                                              '1'),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow(
                                            responsive,
                                            'Fecha Solicitada:',
                                            '27/11/2018',
                                            'Fecha Aprobada:',
                                            '28/11/2018',
                                          ),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow2(
                                            responsive,
                                            'Cantidad Solicitada:',
                                            'S/ 61,500.00',
                                            'Cantidad Aprobada:',
                                            'S/ 61,500.00',
                                          ),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow(responsive, 'Cuotas:', '30',
                                              'Monto Girado:', 'S/ 5,720.80'),
                                          SizedBox(
                                            height: responsive.hp(4),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: responsive.wp(3),
                                                  vertical: responsive.hp(.8),
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.pink),
                                                child: Text(
                                                  'Ver detalles de cuotas',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: responsive.ip(2),
                                                  ),
                                                ),
                                              ).ripple(
                                                () {
                                                  Navigator.of(context).push(
                                                    PageRouteBuilder(
                                                      opaque: false,
                                                      pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) {
                                                        return DetailsPrestamos(
                                                            index: '0');
                                                      },
                                                      transitionsBuilder:
                                                          (context,
                                                              animation,
                                                              secondaryAnimation,
                                                              child) {
                                                        var begin =
                                                            Offset(0.0, 1.0);
                                                        var end = Offset.zero;
                                                        var curve = Curves.ease;

                                                        var tween = Tween(
                                                                begin: begin,
                                                                end: end)
                                                            .chain(
                                                          CurveTween(
                                                              curve: curve),
                                                        );

                                                        return SlideTransition(
                                                          position: animation
                                                              .drive(tween),
                                                          child: child,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _datosRow(
                                              responsive,
                                              'Codigo:',
                                              'AC005',
                                              'N° de Cheque:',
                                              '84810411'),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow(
                                              responsive,
                                              'Nombre:',
                                              'Acosta Diaz, Arturo',
                                              'Prioridad:',
                                              'Emergencia'),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow(
                                              responsive,
                                              'Tipo:',
                                              'Ampliación',
                                              'Tasa De Interes:',
                                              '1'),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow(
                                            responsive,
                                            'Fecha Solicitada:',
                                            '27/11/2018',
                                            'Fecha Aprobada:',
                                            '28/11/2018',
                                          ),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow2(
                                            responsive,
                                            'Cantidad Solicitada:',
                                            'S/ 61,500.00',
                                            'Cantidad Aprobada:',
                                            'S/ 61,500.00',
                                          ),
                                          SizedBox(height: responsive.hp(1.5)),
                                          _datosRow(responsive, 'Cuotas:', '30',
                                              'Monto Girado:', 'S/ 5,720.80'),
                                          SizedBox(
                                            height: responsive.hp(4),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: responsive.wp(3),
                                                  vertical: responsive.hp(.5),
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.pink),
                                                child: Text(
                                                  'Ver detalles de cuotas',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: responsive.ip(2),
                                                  ),
                                                ),
                                              ).ripple(
                                                () {
                                                  Navigator.of(context).push(
                                                    PageRouteBuilder(
                                                      opaque: false,
                                                      pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) {
                                                        return DetailsPrestamos(
                                                            index: '0');
                                                      },
                                                      transitionsBuilder:
                                                          (context,
                                                              animation,
                                                              secondaryAnimation,
                                                              child) {
                                                        var begin =
                                                            Offset(0.0, 1.0);
                                                        var end = Offset.zero;
                                                        var curve = Curves.ease;

                                                        var tween = Tween(
                                                                begin: begin,
                                                                end: end)
                                                            .chain(
                                                          CurveTween(
                                                              curve: curve),
                                                        );

                                                        return SlideTransition(
                                                          position: animation
                                                              .drive(tween),
                                                          child: child,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                            },
                          ),
                        ),
                      ),
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

  Widget _datosRow(Responsive responsive, String title, String subtitle,
      String title2, String subtitle2) {
    return Row(
      children: [
        Container(
          width: responsive.wp(47),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: responsive.ip(2), fontWeight: FontWeight.w700),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: responsive.ip(1.5),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: responsive.wp(47),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(
                    fontSize: responsive.ip(2), fontWeight: FontWeight.w700),
              ),
              Text(
                subtitle2,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: responsive.ip(1.5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _datosRow2(Responsive responsive, String title, String subtitle,
      String title2, String subtitle2) {
    return Row(
      children: [
        Container(
          width: responsive.wp(47),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: responsive.ip(2), fontWeight: FontWeight.w700),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.ip(2),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: responsive.wp(47),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(
                    fontSize: responsive.ip(2), fontWeight: FontWeight.w700),
              ),
              Text(
                subtitle2,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.ip(2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PromocionesInicio extends StatefulWidget {
  const PromocionesInicio({
    Key key,
    @required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  _PromocionesInicioState createState() => _PromocionesInicioState();
}

class _PromocionesInicioState extends State<PromocionesInicio> {
  @override
  Widget build(BuildContext context) {
    final prestamosItemBloc = ProviderBloc.presta(context);
    //prestamosItemBloc.changePrestamosItem(0);
    return StreamBuilder(
        stream: prestamosItemBloc.prestamosItemStream,
        builder: (context, AsyncSnapshot<int> snapshot) {
          return Column(children: [
            CarouselSlider(
              options: CarouselOptions(
                height: widget.responsive.hp(20),
                //carouselController: buttonCarouselController,
                viewportFraction: 0.8,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,

                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, _) {
                  prestamosItemBloc.changePrestamosItem(index);
                },
                onScrolled: (data) {
                  /* _scrollController.animateTo(
            data * size.width,
            /* ((data * 125 / imageSliders.length) / 100) *
                _scrollController.position.maxScrollExtent */

            curve: Curves.ease,
            duration: const Duration(milliseconds: 100),
          ); */
                },
              ),
              items: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailsPrestamos(index: '0');
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(
                            CurveTween(curve: curve),
                          );

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'index1',
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[700],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.responsive.wp(2),
                          vertical: widget.responsive.hp(1),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'N° de Cheque',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: widget.responsive.ip(2),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '84810303',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: widget.responsive.ip(2),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: widget.responsive.hp(2),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.responsive.wp(2),
                              ),
                              height: widget.responsive.hp(10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: widget.responsive.wp(45),
                                      child: Text(
                                        'S/. 61,500.00',
                                        style: TextStyle(
                                            fontSize: widget.responsive.ip(2.7),
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: widget.responsive.wp(2),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: widget.responsive.wp(21),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: widget.responsive.wp(20),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.blue[700],
                                          ),
                                          child: Center(
                                            child: Text(
                                              '80%',
                                              style: TextStyle(
                                                  fontSize:
                                                      widget.responsive.ip(2),
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return DetailsPrestamos(index: '1');
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(
                            CurveTween(curve: curve),
                          );

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red[700],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.responsive.wp(2),
                        vertical: widget.responsive.hp(1),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'N° de Cheque',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.responsive.ip(2),
                                ),
                              ),
                              Spacer(),
                              Text(
                                '84810303',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.responsive.ip(2),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: widget.responsive.hp(2),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: widget.responsive.wp(2)),
                            height: widget.responsive.hp(10),
                            child: Row(
                              children: [
                                Container(
                                  width: widget.responsive.wp(45),
                                  child: Text(
                                    'S/. 61,500.00',
                                    style: TextStyle(
                                        fontSize: widget.responsive.ip(2.7),
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: widget.responsive.wp(2),
                                ),
                                Container(
                                  width: widget.responsive.wp(24),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: widget.responsive.wp(20),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red[700],
                                      ),
                                      child: Center(
                                        child: Text(
                                          '80%',
                                          style: TextStyle(
                                              fontSize: widget.responsive.ip(2),
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: widget.responsive.wp(1),
            ),
            Container(
              height: widget.responsive.hp(1.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                  (index) => _Puntos(snapshot.data, index),
                ),
              ),
            ),
          ]);
        });
  }
}

class _Puntos extends StatelessWidget {
  final int current;
  final int index;
  _Puntos(this.current, this.index);

  @override
  Widget build(BuildContext context) {
    final prestamosItemBloc = ProviderBloc.presta(context);
    final responsive = Responsive.of(context);
    return StreamBuilder(
        stream: prestamosItemBloc.prestamosItemStream,
        builder: (context, AsyncSnapshot<int> snapshot) {
          return Container(
            width: responsive.hp(1),
            height: responsive.hp(1),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: (current == index) ? Colors.redAccent : Colors.grey,
              shape: BoxShape.circle,
            ),
          );
        });
  }
}
