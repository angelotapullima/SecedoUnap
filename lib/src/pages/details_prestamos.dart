import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/model/cuotas_prestamos_model.dart';
import 'package:secedo_unap/src/model/prestamos_model.dart';
import 'package:secedo_unap/src/pages/tabs/InicioTab.dart';
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
    cuotasPrestamosBloc.obtenerPrestamosPagados(widget.prestamo.idPrestamo);
    cuotasPrestamosBloc.obtenerPrestamosPendientes(widget.prestamo.idPrestamo);

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
          Container(
            height: responsive.hp(89),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            margin: EdgeInsets.only(top: responsive.hp(11)),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    toolbarHeight: responsive.hp(30),
                    automaticallyImplyLeading: false,
                    flexibleSpace: Container(
                      padding: EdgeInsets.only(
                        left: responsive.wp(2),
                        right: responsive.wp(2),
                        bottom: responsive.hp(4),
                      ),
                      child: PrestamosItem(
                        prestamoModel: widget.prestamo,
                        mostrarButton: false,
                      ),
                    ),
                    bottom: TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          icon: null,
                          text: 'Cuotas Pendientes',
                        ),
                        Tab(
                          icon: null,
                          text: 'Cuotas Canceladas',
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      StreamBuilder(
                        stream:
                            cuotasPrestamosBloc.cuotasPrestamosPendientesStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<CuotasPrestamosModel>>
                                snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.length > 0) {
                              return ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  vertical: responsive.hp(1),
                                ),
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: snapshot.data.length,
                                itemBuilder: (_, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                          top: responsive.hp(5),
                                        ),
                                        height: responsive.hp(14),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: responsive.wp(28),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        ' Monto de pago',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                responsive.ip(1.4),
                                                            color: Colors.blue[900],
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: responsive.hp(1),
                                                      ),
                                                      Text(
                                                        'S/. ${snapshot.data[index].cuota}',
                                                        style: TextStyle(
                                                            fontSize:
                                                                responsive.ip(1.8),
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Column(
                                                  children: [ Text(
                                                        'Monto',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize:
                                                                responsive.ip(1.4),
                                                            color: Colors.blue[900],
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    Text(
                                                      'S/.${snapshot.data[index].monto}',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: responsive.ip(2),
                                                          color: Colors.blue[900]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Divider(thickness: 1,)
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: responsive.wp(2),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: responsive.wp(5),
                                            vertical: responsive.hp(.5),
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            'Cuota N° ${snapshot.data[index].posicion}   -  ${snapshot.data[index].vencimiento}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                  /* _datosRow(
                              responsive,
                              'Importe:',
                              'S/.${widget.prestamo.monto}',
                              'Vencimiento:',
                              '${widget.prestamo.vencimiento}') */
                                  /*  : _datosRow(
                              responsive,
                              'Importe:',
                              'S/.${widget.prestamo.cuota}',
                              'Fecha de pago:',
                              '${widget.prestamo.fpago}'), */

                                  /*  return CardExpandable(
                                    prestamo: snapshot.data[index],
                                  ); */
                                },
                              );
                            } else {
                              return Center(
                                child: Text('No hay Cuotas'),
                              );
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                      StreamBuilder(
                        stream:
                            cuotasPrestamosBloc.cuotasPrestamosPagadosStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<CuotasPrestamosModel>>
                                snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.length > 0) {
                              return ListView.builder(
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
                              );
                            } else {
                              return Center(
                                child: Text('No hay Cuotas'),
                              );
                            }
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
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
                      height: responsive.hp(14),
                      child: (widget.prestamo.estadoPagado == '0')
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  Container(
                                    width: responsive.wp(25),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Fecha de \nvencimiento',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: responsive.ip(1.2),
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: responsive.hp(1)),
                                        Text(
                                          '${widget.prestamo.vencimiento}',
                                          style: TextStyle(
                                              fontSize: responsive.ip(1.5),
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'S/.${widget.prestamo.monto}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: responsive.ip(2),
                                        color: Colors.blue[900]),
                                  ),
                                ])
                          /* _datosRow(
                              responsive,
                              'Importe:',
                              'S/.${widget.prestamo.monto}',
                              'Vencimiento:',
                              '${widget.prestamo.vencimiento}') */
                          : _datosRow(
                              responsive,
                              'Importe:',
                              'S/.${widget.prestamo.cuota}',
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
                              ? _datosRow3(
                                  responsive,
                                  'Pagado:',
                                  ('${widget.prestamo.pagado}' == 'null')
                                      ? '-'
                                      : '${widget.prestamo.pagado}',
                                  'Fecha de pago:',
                                  ('${widget.prestamo.fpago}' == 'null')
                                      ? '-'
                                      : '${widget.prestamo.fpago}',
                                )
                              : _datosRow3(
                                  responsive,
                                  'Pagado:',
                                  'S/.${widget.prestamo.pagado}',
                                  'Vencimiento:',
                                  '${widget.prestamo.vencimiento}',
                                ),
                          SizedBox(
                            height: responsive.hp(1),
                          ),
                          /* _datosRow2(responsive, 'Pagado:', 'S/.5,000.00',
                                'Principal:', '04/01/2019'), */
                          SizedBox(
                            height: responsive.hp(1),
                          ),
                          /*   (widget.prestamo.estadoPagado == '0')
                              ? _datosRow3(
                                  responsive,
                                  'Principal:',
                                  'S/. ${widget.prestamo.principal}',
                                  'Monto:',
                                  'S/. ${widget.prestamo.cuota}')
                              : _datosRow3(
                                  responsive,
                                  'Principal:',
                                  'S/. ${widget.prestamo.principal}',
                                  'Monto:',
                                  'S/. ${widget.prestamo.monto}'), */
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
}

/* 
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
 */
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
