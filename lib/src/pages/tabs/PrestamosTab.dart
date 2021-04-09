import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
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
                            'APR',
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
                      height: responsive.hp(35),
                      child: PromocionesInicio(
                        responsive: responsive,
                      ),
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
                                          ),
                                          SizedBox(height: responsive.hp(2)),
                                          _datosRow(
                                              responsive,
                                              'Codigo:',
                                              'AC005',
                                              'N° de Cheque:',
                                              '84810411'),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow(
                                              responsive,
                                              'Nombre:',
                                              'Acosta Diaz, Arturo',
                                              'Prioridad:',
                                              'Emergencia'),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow(
                                              responsive,
                                              'Tipo:',
                                              'Ampliación',
                                              'Tasa De Interes:',
                                              '1'),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow(
                                            responsive,
                                            'Fecha Solicitada:',
                                            '27/11/2018',
                                            'Fecha Aprobada:',
                                            '28/11/2018',
                                          ),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow2(
                                            responsive,
                                            'Cantidad Solicitada:',
                                            'S/ 61,500.00',
                                            'Cantidad Aprobada:',
                                            'S/ 61,500.00',
                                          ),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow(responsive, 'Cuotas:', '30',
                                              'Monto Girado:', 'S/ 5,720.80'),
                                          SizedBox(
                                            height: responsive.hp(4),
                                          ),
                                        ],
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                          ),
                                          SizedBox(height: responsive.hp(2)),
                                          _datosRow(
                                              responsive,
                                              'Codigo:',
                                              'AC005',
                                              'N° de Cheque:',
                                              '84810411'),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow(
                                              responsive,
                                              'Nombre:',
                                              'Acosta Diaz, Arturo',
                                              'Prioridad:',
                                              'Emergencia'),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow(
                                              responsive,
                                              'Tipo:',
                                              'Ampliación',
                                              'Tasa De Interes:',
                                              '1'),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow(
                                            responsive,
                                            'Fecha Solicitada:',
                                            '27/11/2018',
                                            'Fecha Aprobada:',
                                            '28/11/2018',
                                          ),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow2(
                                            responsive,
                                            'Cantidad Solicitada:',
                                            'S/ 61,500.00',
                                            'Cantidad Aprobada:',
                                            'S/ 61,500.00',
                                          ),
                                          SizedBox(height: responsive.hp(2)),
                                          Divider(),
                                          _datosRow(responsive, 'Cuotas:', '30',
                                              'Monto Girado:', 'S/ 5,720.80'),
                                          SizedBox(
                                            height: responsive.hp(4),
                                          ),
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
                    fontSize: responsive.ip(1.5), fontWeight: FontWeight.w700),
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
                    fontSize: responsive.ip(1.5), fontWeight: FontWeight.w700),
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
                    fontSize: responsive.ip(1.7), fontWeight: FontWeight.w700),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.ip(1.8),
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
                    fontSize: responsive.ip(1.7), fontWeight: FontWeight.w700),
              ),
              Text(
                subtitle2,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: responsive.ip(1.8),
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
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    final prestamosItemBloc = ProviderBloc.presta(context);
    //prestamosItemBloc.changePrestamosItem(0);
    //
    final responsive = Responsive.of(context);
    return StreamBuilder(
        stream: prestamosItemBloc.prestamosItemStream,
        builder: (context, AsyncSnapshot<int> snapshot) {
          return Container(
            height: responsive.hp(33),
            child: Column(children: [
              Container(
                height: widget.responsive.hp(32),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: widget.responsive.hp(32),
                    //carouselController: buttonCarouselController,
                    viewportFraction: 0.95,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,

                    enableInfiniteScroll: false,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    onPageChanged: (index, _) {
                      prestamosItemBloc.changePrestamosItem(index);
                    },
                    onScrolled: (data) {},
                  ),
                  items: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return DetailsPrestamos(index: '0');
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                        margin: EdgeInsets.symmetric(
                          vertical: widget.responsive.hp(.5),
                          horizontal: widget.responsive.wp(2),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
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
                                      color: Colors.black,
                                      fontSize: widget.responsive.ip(1.8),
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: Text(
                                      '84810303',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: widget.responsive.ip(1.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: responsive.hp(1)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'S/. 12,300.00',
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive.ip(2),
                                        ),
                                      ),
                                      Text(
                                        'deuda por pagar',
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive.ip(1.5),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: widget.responsive.hp(2),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: responsive.hp(2),
                                  ),
                                  Container(
                                    width: responsive.wp(33),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Indicator(
                                          size: responsive.ip(1.6),
                                          color: Color(0xFF218A07),
                                          text: 'Monto Pagado S/.49,200.00',
                                          isSquare: true,
                                        ),
                                        SizedBox(
                                          height: responsive.hp(1.6),
                                        ),
                                        Indicator(
                                          color: Color(0xFFEE0221),
                                          text: 'Monto Por pagar S/. 12,300.00',
                                          isSquare: true,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: responsive.wp(10),
                                  ),
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 1.2,
                                      child: PieChart(
                                        PieChartData(
                                          pieTouchData: PieTouchData(
                                            touchCallback: (pieTouchResponse) {
                                              setState(
                                                () {
                                                  final desiredTouch =
                                                      pieTouchResponse
                                                                  .touchInput
                                                              is! PointerExitEvent &&
                                                          pieTouchResponse
                                                                  .touchInput
                                                              is! PointerUpEvent;
                                                  if (desiredTouch &&
                                                      pieTouchResponse
                                                              .touchedSection !=
                                                          null) {
                                                    touchedIndex =
                                                        pieTouchResponse
                                                            .touchedSectionIndex;
                                                  } else {
                                                    touchedIndex = -1;
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                          borderData: FlBorderData(
                                            show: false,
                                          ),
                                          sectionsSpace: 4,
                                          centerSpaceRadius: 30,
                                          sections: showingSections(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Actualizado al 21/05/2019',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: responsive.ip(1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return DetailsPrestamos(index: '0');
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
                        margin: EdgeInsets.symmetric(
                          vertical: widget.responsive.hp(.5),
                          horizontal: widget.responsive.wp(2),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
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
                                      color: Colors.black,
                                      fontSize: widget.responsive.ip(1.8),
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: Text(
                                      '84810303',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: widget.responsive.ip(1.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: responsive.hp(1)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'S/. 12,300.00',
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive.ip(2),
                                        ),
                                      ),
                                      Text(
                                        'deuda por pagar',
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive.ip(1.5),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: widget.responsive.hp(2),
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: responsive.hp(2),
                                  ),
                                  Container(
                                    width: responsive.wp(33),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Indicator(
                                          size: responsive.ip(1.6),
                                          color: Color(0xFF218A07),
                                          text: 'Monto Pagado S/.49,200.00',
                                          isSquare: true,
                                        ),
                                        SizedBox(
                                          height: responsive.hp(1.6),
                                        ),
                                        Indicator(
                                          color: Color(0xFFEE0221),
                                          text: 'Monto Por pagar S/. 12,300.00',
                                          isSquare: true,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: responsive.wp(10),
                                  ),
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 1.2,
                                      child: PieChart(
                                        PieChartData(
                                          pieTouchData: PieTouchData(
                                            touchCallback: (pieTouchResponse) {
                                              setState(
                                                () {
                                                  final desiredTouch =
                                                      pieTouchResponse
                                                                  .touchInput
                                                              is! PointerExitEvent &&
                                                          pieTouchResponse
                                                                  .touchInput
                                                              is! PointerUpEvent;
                                                  if (desiredTouch &&
                                                      pieTouchResponse
                                                              .touchedSection !=
                                                          null) {
                                                    touchedIndex =
                                                        pieTouchResponse
                                                            .touchedSectionIndex;
                                                  } else {
                                                    touchedIndex = -1;
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                          borderData: FlBorderData(
                                            show: false,
                                          ),
                                          sectionsSpace: 4,
                                          centerSpaceRadius: 30,
                                          sections: showingSections(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Actualizado al 21/05/2019',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: responsive.ip(1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
              SizedBox(
                height: widget.responsive.hp(1),
              ),
              Container(
                height: widget.responsive.hp(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) => _Puntos(snapshot.data, index),
                  ),
                ),
              ),
            ]),
          );
        });
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        final double fontSize = isTouched ? 25 : 16;
        final double radius = isTouched ? 60 : 50;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xFF218A07),
              value: 80,
              title: '80%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff),
              ),
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xFFEE0221),
              value: 20,
              title: '20%',
              radius: radius,
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff),
              ),
            );

          default:
            return null;
        }
      },
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final responsive = Responsive.of(context);
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
         SizedBox(
          width: responsive.wp(1),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: responsive.ip(1.5), fontWeight: FontWeight.bold, color: textColor),
          ),
        )
      ],
    );
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
