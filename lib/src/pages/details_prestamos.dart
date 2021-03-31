import 'package:flutter/material.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';

class DetailsPrestamos extends StatelessWidget {
  const DetailsPrestamos({Key key, @required this.index}) : super(key: key);

  final String index;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: Material(
        child: Stack(
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
              child: Container(
               
                height: responsive.hp(89),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7F8),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (_, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            Container(
                              height: responsive.hp(23),
                              margin: EdgeInsets.symmetric(
                                horizontal: responsive.wp(8),
                                vertical: responsive.hp(1),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.wp(2),
                                vertical: responsive.hp(3),
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue[700],
                                borderRadius: BorderRadius.circular(10),
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
                                            fontSize: responsive.ip(2),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '84810303',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: responsive.ip(2),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: responsive.hp(2),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: responsive.wp(2),
                                    ),
                                    height: responsive.hp(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            width: responsive.wp(45),
                                            child: Text(
                                              'S/. 61,500.00',
                                              style: TextStyle(
                                                  fontSize: responsive.ip(2.7),
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: responsive.wp(2),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: responsive.wp(21),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Container(
                                                width: responsive.wp(16),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.blue[700],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '80%',
                                                    style: TextStyle(
                                                        fontSize:
                                                            responsive.ip(2),
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: responsive.wp(3),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Cronograma de pago',
                                    style: TextStyle(
                                      fontSize: responsive.ip(2.5),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return CardExpandable(
                        index: index.toString(),
                      );
                    }),
              ),
            )
          ],
        ),
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
            vertical: responsive.hp(1.5),
            horizontal: responsive.wp(2),
          ),
          padding: EdgeInsets.symmetric(
            vertical: responsive.hp(1.5),
            horizontal: responsive.wp(2),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: responsive.hp(2)),
                height: responsive.hp(7),
                child: _datosRow(responsive, 'Monto:', 'S/.5,000.00',
                    'Vencimiento:', '04/01/2019'),
              ),
              ExpandableContainer(
                  expanded: expandFlag,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      _datosRow(responsive, 'Monto:', 'S/.5,000.00',
                          'Fecha de pago:', '04/01/2019'),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      _datosRow(responsive, 'Pagado:', 'S/.5,000.00',
                          'Principal:', '04/01/2019'),
                      SizedBox(
                        height: responsive.hp(1),
                      ),
                      _datosRow(responsive, 'Interes:', 'S/.5,000.00',
                          'Cuotas:', '30'),
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
          top: responsive.hp(1),
          left: responsive.wp(2),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(2),
              vertical: responsive.hp(.5),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Cuota N° ${widget.index}',
              style: TextStyle(color: Colors.white),
            ),
          ),
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
                    color: Colors.green,
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

  Widget _datosRow(Responsive responsive, String title, String subtitle,
      String title2, String subtitle2) {
    return Row(
      children: [
        Container(
          width: responsive.wp(30),
          child: Column(
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
                  fontSize: responsive.ip(1.5),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: responsive.wp(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title2,
                style: TextStyle(
                    fontSize: responsive.ip(1.8),
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
      height: expanded ? responsive.hp(19) : collapsedHeight,
      child: Container(
        child: child,
      ),
    );
  }
}
