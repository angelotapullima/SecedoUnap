import 'package:flutter/material.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';

class PagosTab extends StatelessWidget {
  const PagosTab({Key key}) : super(key: key);

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
              color: Colors.black,
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.wp(3),
                        vertical: responsive.hp(1),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Descuentos por Planilla',
                            style: TextStyle(
                                fontSize: responsive.ip(3),
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
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
                          color: Color(0xFFF6F7F8),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: responsive.hp(1),
                            ),
                            Planilla(responsive: responsive),
                            Container(
                              width: double.infinity,
                              color:Colors.grey[300],
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: responsive.wp(2),
                                  vertical: responsive.hp(1),
                                ),
                                child: Text(
                                  'Planilla descontada por la UNAP',
                                  style: TextStyle(
                                      fontSize: responsive.ip(1.7),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: responsive.hp(1),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 4,
                                  itemBuilder: (_, index) {
                                    return CardExpandable(
                                      index: (index + 1).toString(),
                                    );
                                  }),
                            )
                          ],
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
}

class CardExpandable extends StatefulWidget {
  const CardExpandable({Key key, @required this.index}) : super(key: key);

  final String index;

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
          ),
          margin: EdgeInsets.symmetric(
            vertical: responsive.hp(1),
            horizontal: responsive.wp(2),
          ),
          padding: EdgeInsets.symmetric(
            vertical: responsive.hp(1),
            horizontal: responsive.wp(2),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: responsive.hp(2.5)),
                height: responsive.hp(9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: responsive.wp(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Enviado (SECEDO):',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.ip(1.4),
                            ),
                          ),
                          Text(
                            'S/. 3,361.00',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: responsive.ip(1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: responsive.wp(30),
                      child: Column(
                        children: [
                          Text(
                            'Descontado (UNAP):',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.ip(1.4),
                            ),
                          ),
                          Text(
                            'S/. 3,361.00',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.green,
                              fontSize: responsive.ip(1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: responsive.wp(30),
                      child: Column(
                        children: [
                          Text(
                            'Diferencia:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.ip(1.4),
                            ),
                          ),
                          Text(
                            'S/. 0,00',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.red,
                              fontSize: responsive.ip(1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ExpandableContainer(
                expanded: expandFlag,
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: responsive.hp(1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Fecha:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Container(
                              height: responsive.hp(.5),
                              color: Colors.green,
                            ),
                            Text(
                              '30/06/2019',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Cesantía:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 109.20',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
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
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 10.50',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
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
                              'Jubilación:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
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
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Multa:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 0.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
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
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 3,230.99',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
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
                              'Garantizado:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
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
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Descuento:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                            Text(
                              'S/. 0.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: responsive.ip(1.4),
                              ),
                            ),
                          ],
                        ),
                        /* Column(
                            children: [
                              Text(
                                'Total:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: responsive.ip(1.8),
                                ),
                              ),
                              Text(
                                '3350.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: responsive.ip(2),
                                ),
                              ),
                            ],
                          ),
                         */
                      ],
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
          top: responsive.hp(0),
          left: responsive.wp(2),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(2),
              vertical: responsive.hp(.5),
            ),
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'N° ${widget.index}',
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
              vertical: responsive.hp(0),
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
      height: expanded ? responsive.hp(23.5) : collapsedHeight,
      child: Container(
        child: child,
      ),
    );
  }
}

class Planilla extends StatelessWidget {
  const Planilla({
    Key key,
    @required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
        vertical: responsive.hp(.5),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: responsive.wp(2),
        vertical: responsive.hp(.5),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Color(0xFFF6F7F8),
      ),
      child: Column(
        children: [
          Text(
            'Planilla enviada hacia la Unap',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: responsive.ip(1.8),
            ),
          ),
          Text(
            'JUNIO 2019',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: responsive.ip(1.8),
            ),
          ),
          SizedBox(
            height: responsive.hp(1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Fecha:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Container(
                    height: responsive.hp(.5),
                    color: Colors.green,
                  ),
                  Text(
                    '30/06/2019',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Cesantía:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Text(
                    '109.20',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Text(
                    '10.50',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                    'Jubilación:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Container(
                    height: responsive.hp(.5),
                    color: Colors.green,
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Multa:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Text(
                    '3230.99',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
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
                    'Garantizado:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Container(
                    height: responsive.hp(.5),
                    color: Colors.green,
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Descuento:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Text(
                    '0.00',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: responsive.ip(1.4),
                    ),
                  ),
                  Text(
                    '3350.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: responsive.ip(1.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
