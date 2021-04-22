import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/model/prestamos_model.dart';
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

    final prestamosBloc = ProviderBloc.prestamos(context);
    prestamosBloc.obtenerPrestamos();

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
              child: StreamBuilder(
                  stream: prestamosBloc.prestamosStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<PrestamosModel>> prestamos) {
                    if (prestamos.hasData) {
                      if (prestamos.data.length > 0) {
                        return SafeArea(
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
                                height: responsive.hp(1),
                              ),
                              Container(
                                height: responsive.hp(38),
                                child: CardPrestamosResumen(
                                    prestamosList: prestamos.data),
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: responsive.wp(3),
                                      right: responsive.wp(3),
                                      top: responsive.hp(2),
                                    ),
                                    child: StreamBuilder(
                                      stream:
                                          prestamosItemBloc.prestamosItemStream,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<int> valor) {
                                        if (valor.hasData) {
                                          return SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            responsive.wp(3),
                                                        vertical:
                                                            responsive.hp(.8),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.pink),
                                                      child: Text(
                                                        'Ver detalles de cuotas',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              responsive.ip(2),
                                                        ),
                                                      ),
                                                    ).ripple(
                                                      () {
                                                        Navigator.of(context)
                                                            .push(
                                                          PageRouteBuilder(
                                                            opaque: false,
                                                            pageBuilder: (context,
                                                                animation,
                                                                secondaryAnimation) {
                                                              return DetailsPrestamos(
                                                                  prestamo: prestamos
                                                                          .data[
                                                                      valor
                                                                          .data]);
                                                            },
                                                            transitionsBuilder:
                                                                (context,
                                                                    animation,
                                                                    secondaryAnimation,
                                                                    child) {
                                                              var begin =
                                                                  Offset(
                                                                      0.0, 1.0);
                                                              var end =
                                                                  Offset.zero;
                                                              var curve =
                                                                  Curves.ease;

                                                              var tween = Tween(
                                                                      begin:
                                                                          begin,
                                                                      end: end)
                                                                  .chain(
                                                                CurveTween(
                                                                    curve:
                                                                        curve),
                                                              );

                                                              return SlideTransition(
                                                                position: animation
                                                                    .drive(
                                                                        tween),
                                                                child: child,
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: responsive.hp(2),
                                                ),
                                                _datosRow(
                                                    responsive,
                                                    'Codigo:',
                                                    'AC005',
                                                    'N° de Cheque:',
                                                    '${prestamos.data[valor.data].cheque}'),
                                                SizedBox(
                                                  height: responsive.hp(2),
                                                ),
                                                Divider(),
                                                _datosRow(
                                                    responsive,
                                                    'Nombre:',
                                                    '--Acosta Diaz, Arturo--',
                                                    'Prioridad:',
                                                    '${prestamos.data[valor.data].prioridad}'),
                                                SizedBox(
                                                  height: responsive.hp(2),
                                                ),
                                                Divider(),
                                                _datosRow(
                                                    responsive,
                                                    'Tipo:',
                                                    '${prestamos.data[valor.data].tipo}',
                                                    'Tasa De Interes:',
                                                    '${prestamos.data[valor.data].tInteres}%'),
                                                SizedBox(
                                                  height: responsive.hp(2),
                                                ),
                                                Divider(),
                                                _datosRow(
                                                  responsive,
                                                  'Fecha Solicitada:',
                                                  '${prestamos.data[valor.data].fSolicitud}',
                                                  'Fecha Aprobada:',
                                                  '${prestamos.data[valor.data].fAprobado}',
                                                ),
                                                SizedBox(
                                                  height: responsive.hp(2),
                                                ),
                                                Divider(),
                                                _datosRow2(
                                                  responsive,
                                                  'Cantidad Solicitada:',
                                                  'S/. ${prestamos.data[valor.data].solicitado}',
                                                  'Cantidad Aprobada:',
                                                  'S/. ${prestamos.data[valor.data].aprobado}',
                                                ),
                                                SizedBox(
                                                  height: responsive.hp(2),
                                                ),
                                                Divider(),
                                                _datosRow(
                                                  responsive,
                                                  'Cuotas:',
                                                  '${prestamos.data[valor.data].nCuotas}',
                                                  'Monto Girado:',
                                                  'S/. ${prestamos.data[valor.data].girar}',
                                                ),
                                                SizedBox(
                                                  height: responsive.hp(4),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return Center(
                                            child: CupertinoActivityIndicator(),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: Text('No hay Prestamos'),
                        );
                      }
                    } else {
                      return Center(child: CupertinoActivityIndicator());
                    }
                  }),
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

class CardPrestamosResumen extends StatefulWidget {
  const CardPrestamosResumen({
    Key key,
    @required this.prestamosList,
  }) : super(key: key);

  final List<PrestamosModel> prestamosList;

  @override
  _CardPrestamosResumenState createState() => _CardPrestamosResumenState();
}

class _CardPrestamosResumenState extends State<CardPrestamosResumen> {
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    final prestamosItemBloc = ProviderBloc.presta(context);
    //prestamosItemBloc.changePrestamosItem(0);
    //
    final responsive = Responsive.of(context);

    final List<Widget> sliders = widget.prestamosList
        .map(
          (item) => Container(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return DetailsPrestamos(
                        prestamo: item,
                      );
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
                margin: EdgeInsets.symmetric(
                  vertical: responsive.hp(.2),
                  horizontal: responsive.wp(2),
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
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(2),
                    vertical: responsive.hp(1),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'N° de Cheque',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: responsive.ip(1.8),
                            ),
                          ),
                          Spacer(),
                          Text(
                            '${item.cheque}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.ip(1.8),
                            ),
                          ),
                          SizedBox(
                            width: responsive.wp(3),
                          )
                        ],
                      ),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'S/. ${item.montoPorPagar}',
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
                        height: responsive.hp(2),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: responsive.wp(2),
                          ),
                          Container(
                            width: responsive.wp(33),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Indicator(
                                  size: responsive.ip(1.6),
                                  color: Color(0xFF218A07),
                                  text: 'Monto Pagado    S/.${item.montoPagado}',
                                  isSquare: true,
                                ),
                                SizedBox(
                                  height: responsive.hp(1.6),
                                ),
                                Indicator(
                                  color: Color(0xFFEE0221),
                                  text:
                                      'Monto Por pagar    S/. ${item.montoPorPagar}',
                                  isSquare: false,
                                ),
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: responsive.wp(10),
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: responsive.ip(0.18),
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(
                                    touchCallback: (pieTouchResponse) {
                                      setState(
                                        () {
                                          final desiredTouch =
                                              pieTouchResponse.touchInput
                                                      is! PointerExitEvent &&
                                                  pieTouchResponse.touchInput
                                                      is! PointerUpEvent;
                                          if (desiredTouch &&
                                              pieTouchResponse.touchedSection !=
                                                  null) {
                                            touchedIndex = pieTouchResponse
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
                                  sectionsSpace: 3,
                                  centerSpaceRadius: responsive.ip(1.15),
                                  sections: showingSections(
                                      responsive,
                                      '${item.porcentajePagado}',
                                      '${item.porcentajeSinPagar}'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '--Actualizado al 21/05/2019--',
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
          ),
        )
        .toList();

    return StreamBuilder(
      stream: prestamosItemBloc.prestamosItemStream,
      builder: (context, AsyncSnapshot<int> snapshot) {
        return Container(
          height: responsive.hp(32),
          child: Column(
            children: [
              Container(
                height: responsive.hp(34),
                child: CarouselSlider(
                    options: CarouselOptions(
                      height: responsive.hp(34),
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
                    items: sliders),
              ),
              SizedBox(
                height: responsive.hp(1),
              ),
              Container(
                height: responsive.hp(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.prestamosList.length,
                    (index) => _Puntos(snapshot.data, index),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<PieChartSectionData> showingSections(Responsive responsive,
      String porcentajePagado, String porcentajeSinPagar) {
    return List.generate(
      2,
      (i) {
        final isTouched = i == touchedIndex;
        final double fontSize =
            isTouched ? responsive.ip(2) : responsive.ip(1.8);
        final double radius = isTouched ? 60 : 50;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xFF218A07),
              value: double.parse(porcentajePagado),
              title: '$porcentajePagado%',
              radius: radius,
              titlePositionPercentageOffset: 0.5,
              //badgeWidget: Text('hfhfhf'),
              titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: const Color(0xffffffff),
              ),
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xFFEE0221),
              value: double.parse(porcentajeSinPagar),
              title: '$porcentajeSinPagar%',
              radius: radius,
              titlePositionPercentageOffset: 0.5,
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
                fontSize: responsive.ip(1.5),
                fontWeight: FontWeight.bold,
                color: textColor),
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
