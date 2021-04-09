import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';

class InicioTab extends StatelessWidget {
  const InicioTab({Key key}) : super(key: key);

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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(3),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Bienvenido Arturo',
                              style: TextStyle(
                                  fontSize: responsive.ip(3),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: responsive.hp(3),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(3),
                        ),
                        child: Text(
                          'Diferencias de pagos',
                          style: TextStyle(
                              fontSize: responsive.ip(2),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      CardExpandable(
                        color: Colors.green,
                        texto: 'Está al día en sus pagos',
                      ),
                      CardExpandable(
                        color: Colors.red,
                        texto: 'Tiene una deuda de S/ 3261.99',
                      ),
                      PieChartSample2(),
                      Container(
                        child: Column(
                          children: [],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardExpandable extends StatefulWidget {
  const CardExpandable({Key key, @required this.color, @required this.texto})
      : super(key: key);

  final Color color;
  final String texto;

  @override
  _CardExpandableState createState() => _CardExpandableState();
}

class _CardExpandableState extends State<CardExpandable> {
  bool expandFlag = false;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.color,
            //border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          margin: EdgeInsets.symmetric(
            vertical: responsive.hp(.8),
            horizontal: responsive.wp(2),
          ),
          padding: EdgeInsets.symmetric(
            vertical: responsive.hp(1.5),
            horizontal: responsive.wp(2),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: responsive.hp(6),
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(2),
                  vertical: responsive.hp(.5),
                ),
                child: Text(
                  widget.texto,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: responsive.ip(2),
                  ),
                ),
              ),
              ExpandableContainer(
                expanded: expandFlag,
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Cesantía:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 109.20',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Funeral:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 10.50',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Jubilación:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Container(
                              height: responsive.hp(.5),
                              color: Colors.green,
                            ),
                            Text(
                              'S/. 0.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1.5),
                    ),
                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Multa:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 0.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'APR:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 3230.99',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Garantizado:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Container(
                              height: responsive.hp(.5),
                              color: Colors.green,
                            ),
                            Text(
                              'S/. 0.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Descuento:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 0.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(3),
                    ),
                    Row(
                      children: [
                        Text(
                          'Actualizado al 21/05/2019',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsive.ip(1.6),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                  ],
                ),
              )
            ],
          ),
        ).ripple(
          () {
            setState(() {
              expandFlag = !expandFlag;
            });
          },
        ),
        Positioned(
          top: responsive.hp(.5),
          right: responsive.wp(2),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(2),
              vertical: responsive.hp(.5),
            ),
            child: IconButton(
              icon: Container(
                height: responsive.ip(8),
                width: responsive.ip(8),
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    expandFlag
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () {
                setState(
                  () {
                    expandFlag = !expandFlag;
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final responsive = Responsive.of(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? responsive.hp(21.5) : collapsedHeight,
      child: Container(
        child: child,
      ),
    );
  }
}

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
        vertical: responsive.hp(1),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: responsive.wp(3),
        vertical: responsive.hp(1),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'APR',
            style: TextStyle(
              color: Colors.blue[900],
              fontWeight: FontWeight.bold,
              fontSize: responsive.ip(3),
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'S/. 61,500.00',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.ip(2.5),
                  ),
                ), Text(
                  'Monto total del prestamo',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: responsive.ip(1.5),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: responsive.hp(2)),
          Row(
            children: <Widget>[
              SizedBox(
                height: responsive.hp(2),
              ),
              Container(
                width: responsive.wp(38),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      size: responsive.ip(1.8),
                      color: Color(0xFF218A07),
                      text: 'Monto Pagado (%80)       S/.49,200.00',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: responsive.hp(2),
                    ),
                    Indicator(
                      color: Color(0xFFEE0221),
                      text: 'Monto Por pagar(%20)       S/. 12,300.00',
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
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (pieTouchResponse) {
                          setState(
                            () {
                              final desiredTouch = pieTouchResponse.touchInput
                                      is! PointerExitEvent &&
                                  pieTouchResponse.touchInput
                                      is! PointerUpEvent;
                              if (desiredTouch &&
                                  pieTouchResponse.touchedSection != null) {
                                touchedIndex =
                                    pieTouchResponse.touchedSectionIndex;
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
    );
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
