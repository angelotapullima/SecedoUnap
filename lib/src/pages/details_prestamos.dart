import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/model/cuotas_prestamos_model.dart';
import 'package:secedo_unap/src/model/prestamos_model.dart';
import 'package:secedo_unap/src/pages/tabs/PrestamosTab.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';

class DetailsPrestamos extends StatefulWidget {
  const DetailsPrestamos({Key key, @required this.prestamo}) : super(key: key);

  final PrestamosModel prestamo;

  @override
  _DetailsPrestamosState createState() => _DetailsPrestamosState();
}

class _DetailsPrestamosState extends State<DetailsPrestamos> {
  final int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final cuotasPrestamosBloc = ProviderBloc.cuotasP(context);
    cuotasPrestamosBloc.obtenerPrestamos(widget.prestamo.idPrestamo);

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
                child: StreamBuilder(
                  stream: cuotasPrestamosBloc.cuotasPrestamosStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CuotasPrestamosModel>> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length > 0) {
                        return Column(
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
                                          '${widget.prestamo.cheque}',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'S/. ${widget.prestamo.montoPorPagar}',
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Indicator(
                                                size: responsive.ip(1.6),
                                                color: Color(0xFF218A07),
                                                text:
                                                    'Monto Pagado    S/.${widget.prestamo.montoPagado}',
                                                isSquare: true,
                                              ),
                                              SizedBox(
                                                height: responsive.hp(1.6),
                                              ),
                                              Indicator(
                                                color: Color(0xFFEE0221),
                                                text:
                                                    'Monto Por pagar S/.${widget.prestamo.montoPorPagar}',
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
                                                centerSpaceRadius: 10,
                                                sections: showingSections(
                                                    responsive,
                                                    '${widget.prestamo.porcentajePagado}',
                                                    '${widget.prestamo.porcentajeSinPagar}'),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            'Actualizado al ${widget.prestamo.fechaActualizado}',
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
                              padding: EdgeInsets.symmetric(
                                vertical: responsive.hp(.5),
                              ),
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
                                padding: EdgeInsets.symmetric(
                                  vertical: responsive.hp(1),
                                ),
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: snapshot.data.length,
                                itemBuilder: (_, index) {
                                  return CardExpandable(
                                    prestamo: snapshot.data[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: Text('No existen datos'),
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

class CardExpandable extends StatefulWidget {
  const CardExpandable({Key key, @required this.prestamo}) : super(key: key);

  final CuotasPrestamosModel prestamo;

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
                padding: EdgeInsets.symmetric(
                  vertical: responsive.hp(0),
                  horizontal: responsive.wp(2),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: responsive.hp(5),
                      ),
                      height: responsive.hp(12),
                      child: (widget.prestamo.estadoPagado == '0')
                          ? _datosRow(
                              responsive,
                              'Importe:',
                              'S/.${widget.prestamo.cuota}',
                              'Vencimiento:',
                              'S/.${widget.prestamo.vencimiento}')
                          : _datosRow(
                              responsive,
                              'Importe:',
                              'S/.${widget.prestamo.pagado}',
                              'Fecha de pago:',
                              '${widget.prestamo.fpago}'),
                    ),
                    ExpandableContainer(
                      expanded: expandFlag,
                      child: ListView(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        children: [
                          (widget.prestamo.estadoPagado == '0')
                              ? _datosRow2(
                                  responsive,
                                  'Pagado:',
                                  ('${widget.prestamo.pagado}' == 'null')
                                      ? '-'
                                      : '${widget.prestamo.pagado}',
                                  'Fecha de pago:',
                                  ('${widget.prestamo.fpago}' == 'null')
                                      ? '-'
                                      : '${widget.prestamo.fpago}',
                                  'Interes:',
                                  'S/. ${widget.prestamo.interes}',
                                )
                              : _datosRow2(
                                  responsive,
                                  'Pagado:',
                                  'S/.${widget.prestamo.pagado}',
                                  'Vencimiento:',
                                  '${widget.prestamo.vencimiento}',
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
                top: 0,
                left: responsive.wp(2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(2),
                    vertical: responsive.hp(.5),
                  ),
                  decoration: BoxDecoration(
                    color: (widget.prestamo.estadoPagado == '1')
                        ? Colors.green
                        : Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Cuota N° ${widget.prestamo.posicion}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                top: -8,
                right: responsive.wp(2),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(2),
                  ),
                  child: IconButton(
                      icon: Container(
                        height: responsive.ip(6),
                        width: responsive.ip(6),
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
