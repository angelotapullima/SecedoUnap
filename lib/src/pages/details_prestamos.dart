import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/pages/tabs/PrestamosTab.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';

class DetailsPrestamos extends StatefulWidget {
  const DetailsPrestamos({Key key, @required this.index}) : super(key: key);

  final String index;

  @override
  _DetailsPrestamosState createState() => _DetailsPrestamosState();
}

class _DetailsPrestamosState extends State<DetailsPrestamos> {
  final int touchedIndex = 0;

  var list = [
    PrestamosCuotas(
      numeroCuota: '1',
      importe: '2,383.01',
      fPago: '31/01/2019',
      pagado: '2,383.01',
      vencimiento: '01/2019',
      interes: '615.00',
      principal: '1,768.00',
      monto: '61,500.00',
      estado: '1',
    ),
    PrestamosCuotas(
      numeroCuota: '2',
      importe: '2,383.01',
      fPago: '18/02/2019',
      pagado: '2,383.01',
      vencimiento: '02/2019',
      interes: '597.00',
      principal: '1,765.99',
      monto: '59,731.99',
      estado: '1',
    ),
    PrestamosCuotas(
      numeroCuota: '3',
      importe: '2,383.01',
      fPago: '13/03/2019',
      pagado: '2,383.01',
      vencimiento: '03/2019',
      interes: '579.46',
      principal: '1,803.55',
      monto: '57,946.30',
      estado: '1',
    ),
    PrestamosCuotas(
      numeroCuota: '4',
      importe: '2,383.00',
      fPago: '31/01/2019',
      pagado: '2,383.00',
      vencimiento: '01/2019',
      interes: '615.00',
      principal: '1,768.00',
      monto: '61,500.00',
      estado: '0',
    ),
    PrestamosCuotas(
      numeroCuota: '5',
      importe: '2,383.00',
      fPago: '31/01/2019',
      pagado: '2,383.00',
      vencimiento: '01/2019',
      interes: '615.00',
      principal: '1,768.00',
      monto: '61,500.00',
      estado: '0',
    ),
    PrestamosCuotas(
      numeroCuota: '6',
      importe: '2,383.00',
      fPago: '31/01/2019',
      pagado: '2,383.00',
      vencimiento: '01/2019',
      interes: '615.00',
      principal: '1,768.00',
      monto: '61,500.00',
      estado: '0',
    ),
    PrestamosCuotas(
      numeroCuota: '7',
      importe: '2,383.00',
      fPago: '31/01/2019',
      pagado: '2,383.00',
      vencimiento: '01/2019',
      interes: '615.00',
      principal: '1,768.00',
      monto: '61,500.00',
      estado: '0',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
          ),
          Container(
            height: responsive.hp(13),
            child: SafeArea(
              child: AppBar(
                backgroundColor: Colors.transparent,
                title: Text('Detalle De Préstamo'),
              ),
            ),
          ),
          Positioned(
            top: responsive.hp(11),
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: Container(
                height: responsive.hp(89),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(3),
                          vertical: responsive.hp(1.5),
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
                                  '84810303',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: responsive.ip(1.7),
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
                              height: responsive.hp(2),
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
                                  width: responsive.wp(15),
                                ),
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1.2,
                                    child: PieChart(
                                      PieChartData(
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
                            SizedBox(
                              height: responsive.hp(1),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.grey[300],
                      padding:
                          EdgeInsets.symmetric(vertical: responsive.hp(.5)),
                      child: Text(
                        'Cuotas según cronograma',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (_, index) {
                            return CardExpandable(
                              prestamo: list[index],
                            );
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

class CardExpandable extends StatefulWidget {
  const CardExpandable({Key key, @required this.prestamo}) : super(key: key);

  final PrestamosCuotas prestamo;

  @override
  _CardExpandableState createState() => _CardExpandableState();
}

class _CardExpandableState extends State<CardExpandable> {
  bool expandFlag = false;
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                /* decoration: BoxDecoration(
                  color: Colors.white,
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
                ), */
                /* margin: EdgeInsets.symmetric(
                  vertical: responsive.hp(.5),
                  horizontal: responsive.wp(2),
                ), */
                padding: EdgeInsets.symmetric(
                  vertical: responsive.hp(0),
                  horizontal: responsive.wp(2),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: responsive.hp(3.2)),
                      height: responsive.hp(10),
                      child: (widget.prestamo.estado == '0')
                          ? _datosRow(
                              responsive,
                              'Importe:',
                              'S/.${widget.prestamo.importe}',
                              'Vencimiento:',
                              'S/.${widget.prestamo.vencimiento}')
                          : _datosRow(
                              responsive,
                              'Importe:',
                              'S/.${widget.prestamo.importe}',
                              'Fecha de pago:',
                              '${widget.prestamo.fPago}'),
                    ),
                    ExpandableContainer(
                        expanded: expandFlag,
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: [
                            (widget.prestamo.estado == '0')
                                ? _datosRow2(
                                    responsive,
                                    'Pagado:',
                                    '${widget.prestamo.pagado}',
                                    'Fecha de pago:',
                                    '${widget.prestamo.fPago}',
                                    'Interes:',
                                    'S/. ${widget.prestamo.interes}',
                                  )
                                : _datosRow2(
                                    responsive,
                                    'Pagado:',
                                    '${widget.prestamo.pagado}',
                                    'Vencimiento:',
                                    'S/.${widget.prestamo.vencimiento}',
                                    'Interes:',
                                    'S/. ${widget.prestamo.interes}',
                                  ),
                            SizedBox(
                              height: responsive.hp(1),
                            ),
                            /* _datosRow2(responsive, 'Pagado:', 'S/.5,000.00',
                                'Principal:', '04/01/2019'), */
                            SizedBox(
                              height: responsive.hp(1),
                            ),
                            _datosRow3(
                                responsive,
                                'Principal:',
                                'S/. ${widget.prestamo.principal}',
                                'Monto:',
                                'S/. ${widget.prestamo.monto}'),
                          ],
                        ))
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
                top: responsive.hp(0),
                left: responsive.wp(2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(2),
                    vertical: responsive.hp(.5),
                  ),
                  decoration: BoxDecoration(
                    color: (widget.prestamo.estado == '0')
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Cuota N° ${widget.prestamo.numeroCuota}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: responsive.wp(2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(2),
                  ),
                  child: IconButton(
                      icon: Container(
                        height: responsive.ip(8),
                        width: responsive.ip(8),
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
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
                        setState(() {
                          expandFlag = !expandFlag;
                        });
                      }),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _datosRow(Responsive responsive, String title, String subtitle,
      String title2, String subtitle2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: responsive.ip(1.8),
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: responsive.ip(2),
                  color: Colors.blue[900]),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title2,
              style: TextStyle(
                  fontSize: responsive.ip(1.5),
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
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
      ],
    );
  }

  Widget _datosRow3(Responsive responsive, String title, String subtitle,
      String title2, String subtitle2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: responsive.ip(1.5),
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
            ),
            Text(
              subtitle,
              style: TextStyle(
                  fontSize: responsive.ip(1.5),
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title2,
              style: TextStyle(
                  fontSize: responsive.ip(1.5),
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
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
      ],
    );
  }

  Widget _datosRow2(Responsive responsive, String title, String subtitle,
      String title2, String subtitle2, String title3, String subtitle3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: responsive.ip(1.5),
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title2,
              style: TextStyle(
                  fontSize: responsive.ip(1.5),
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title3,
              style: TextStyle(
                  fontSize: responsive.ip(1.5),
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600]),
            ),
            Text(
              subtitle3,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: responsive.ip(1.5),
              ),
            ),
          ],
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
      height: expanded ? responsive.hp(14) : collapsedHeight,
      child: Container(
        child: child,
      ),
    );
  }
}

class PrestamosCuotas {
  String numeroCuota;
  String importe;
  String fPago;
  String pagado;
  String vencimiento;
  String interes;
  String principal;
  String monto;
  String estado;

  PrestamosCuotas(
      {this.numeroCuota,
      this.importe,
      this.fPago,
      this.pagado,
      this.vencimiento,
      this.interes,
      this.principal,
      this.monto,
      this.estado});
}
