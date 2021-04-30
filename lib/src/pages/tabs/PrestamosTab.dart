import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/model/prestamos_model.dart';
import 'package:secedo_unap/src/pages/details_prestamos.dart';
import 'package:secedo_unap/src/pages/tabs/InicioTab.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/responsive.dart';

class PrestamosTab extends StatelessWidget {
  const PrestamosTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final prestamosItemBloc = ProviderBloc.presta(context);
    prestamosItemBloc.changePrestamosItem(0);

    final prestamosBloc = ProviderBloc.prestamos(context);
    prestamosBloc.obtenerPrestamos();

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
                      height: responsive.hp(1),
                    ),
                    StreamBuilder(
                      stream: prestamosBloc.prestamosStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<PrestamosModel>> prestamos) {
                        if (prestamos.hasData) {
                          if (prestamos.data.length > 0) {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: prestamos.data.length,
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  return PrestamosItem(
                                    prestamoModel: prestamos.data[index],
                                  );},
                              ),
                            );
/* 

                         */
                          } else {
                            return Center(
                              child: Text('No hay Prestamos'),
                            );
                          }
                        } else {
                          return Center(child: CupertinoActivityIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
