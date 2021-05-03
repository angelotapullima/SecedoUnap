
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/model/deudas_model.dart';
import 'package:secedo_unap/src/model/prestamos_model.dart';
import 'package:secedo_unap/src/pages/details_prestamos.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';
import 'package:secedo_unap/src/utils/utils.dart';

class InicioTab extends StatefulWidget {
  const InicioTab({Key key}) : super(key: key);

  @override
  _InicioTabState createState() => _InicioTabState();
}

class _InicioTabState extends State<InicioTab> {
  final _pageController =
      PageController(viewportFraction: 0.92, initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final prestamosBloc = ProviderBloc.prestamos(context);
    prestamosBloc.obtenerPrestamos();

    final deudasBloc = ProviderBloc.deudas(context);
    deudasBloc.obtenerDeudas();

    final prefs = Preferences();

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
                            Expanded(
                              child: Text(
                                'Bienvenido ${prefs.nombrePersona}',
                                style: TextStyle(
                                    fontSize: responsive.ip(3),
                                    fontWeight: FontWeight.bold),
                              ),
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
                      StreamBuilder(
                        stream: deudasBloc.deudaControllerStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<DeudasModel>> deudasSnapshot) {
                          if (deudasSnapshot.hasData) {
                            if (deudasSnapshot.data.length > 0) {
                              return CardExpandable(
                                deudas: deudasSnapshot.data[0],
                                color:
                                    (deudasSnapshot.data[0].estadoDeuda == '1')
                                        ? Colors.red
                                        : Colors.green,
                                texto: (deudasSnapshot.data[0].estadoDeuda ==
                                        '1')
                                    ? 'Tiene una deuda de S/.${deudasSnapshot.data[0].capital}'
                                    : 'Felicitaciones!, Está al día en sus pagos',
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: responsive.hp(2),
                      ),
                      StreamBuilder(
                        stream: prestamosBloc.prestamosStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<PrestamosModel>> prestamos) {
                          if (prestamos.hasData) {
                            if (prestamos.data.length > 0) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: responsive.wp(4),
                                      ),
                                      Text(
                                        'APR',
                                        style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: responsive.ip(3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: responsive.hp(43),
                                    child: PageView.builder(
                                      itemCount: prestamos.data.length,
                                      controller: _pageController,
                                      itemBuilder: (context, index) {
                                        return PrestamosItem(
                                          prestamoModel: prestamos.data[index],
                                          mostrarButton: true,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Center(
                                child: Container(),
                              );
                            }
                          } else {
                            return Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                        },
                      ),
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
  const CardExpandable(
      {Key key,
      @required this.color,
      @required this.texto,
      @required this.deudas})
      : super(key: key);

  final Color color;
  final String texto;
  final DeudasModel deudas;

  @override
  _CardExpandableState createState() => _CardExpandableState();
}

class _CardExpandableState extends State<CardExpandable> {
  bool expandFlag = true;
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
                height: responsive.hp(8),
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(2),
                  vertical: responsive.hp(.5),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.texto,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: responsive.ip(2),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: responsive.wp(10),
                    )
                  ],
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
                              ('${widget.deudas.cesantia}' == 'null')
                                  ? '-'
                                  : 'S/.${dosdecimales(double.parse(widget.deudas.cesantia))}',
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
                              ('${widget.deudas.funeral}' == 'null')
                                  ? '-'
                                  : 'S/.${dosdecimales(double.parse(widget.deudas.funeral))}',
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
                              ('${widget.deudas.jubilacion}' == 'null')
                                  ? '-'
                                  : 'S/.${dosdecimales(double.parse(widget.deudas.jubilacion))}',
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
                              ('${widget.deudas.multa}' == 'null')
                                  ? '-'
                                  : 'S/.${dosdecimales(double.parse(widget.deudas.multa))}',
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
                              ('${widget.deudas.apr}' == 'null')
                                  ? '-'
                                  : 'S/.${dosdecimales(double.parse(widget.deudas.apr))}',
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
                              ('${widget.deudas.garantizado}' == 'null')
                                  ? '-'
                                  : 'S/.${dosdecimales(double.parse(widget.deudas.garantizado))}',
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
                              ('${widget.deudas.descuento}' == 'null')
                                  ? '-'
                                  : 'S/.${dosdecimales(double.parse(widget.deudas.descuento))}',
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
                          'Actualizado al ${widget.deudas.fechaAtual}',
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

class PrestamosItem extends StatefulWidget {
  PrestamosItem(
      {Key key, @required this.prestamoModel, @required this.mostrarButton})
      : super(key: key);

  final PrestamosModel prestamoModel;
  final bool mostrarButton;
  @override
  _PrestamosItemState createState() => _PrestamosItemState();
}

class _PrestamosItemState extends State<PrestamosItem> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final prefs = Preferences();
    return InkWell(
      onTap: () {
        if (widget.mostrarButton) {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (context, animation, secondaryAnimation) {
                return DetailsPrestamos(
                  prestamo: widget.prestamoModel,
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
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: responsive.hp(2)),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: responsive.hp(.2),
                left: responsive.wp(4),
                right: responsive.wp(2),
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
                    SizedBox(
                      height: responsive.hp(5),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(3),
                        ),
                        Text(
                          'Código :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          '${prefs.codigo}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Prioridad :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          '${widget.prestamoModel.prioridad}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(3),
                        ),
                        Text(
                          'Tipo :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          '${widget.prestamoModel.tipo}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Tasa de interes :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          '${widget.prestamoModel.tInteres}%',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(3),
                        ),
                        Text(
                          'Fecha solicitada :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          '${widget.prestamoModel.fSolicitud}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(3),
                        ),
                        Text(
                          'Fecha Aprobación :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          '${widget.prestamoModel.fAprobado}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(3),
                        ),
                        Text(
                          'Cantidad Solicitada :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          'S/. ${widget.prestamoModel.solicitado}',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(2),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(3),
                        ),
                        Text(
                          'Cantidad Aprobada :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          'S/. ${widget.prestamoModel.aprobado}',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(2),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(3),
                        ),
                        Text(
                          'Monto Girado :',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: responsive.ip(1.8),
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          'S/. ${widget.prestamoModel.girar}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: responsive.wp(3),
                        ),
                        Text(
                          'Cuotas :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(2),
                        ),
                        Text(
                          '${widget.prestamoModel.nCuotas}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: responsive.ip(1.8),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    (widget.mostrarButton)
                        ? Row(
                            children: [
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsive.wp(3),
                                  vertical: responsive.hp(.5),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue),
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
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return DetailsPrestamos(
                                            prestamo: widget.prestamoModel);
                                      },
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = Offset(0.0, 1.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;

                                        var tween =
                                            Tween(begin: begin, end: end).chain(
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
                              )
                            ],
                          )
                        : Container(),
                    SizedBox(
                      height: responsive.hp(2),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: responsive.wp(1),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: responsive.wp(3), vertical: responsive.hp(1)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[400]),
                child: Text(
                  'N° de Cheque ${widget.prestamoModel.cheque}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
