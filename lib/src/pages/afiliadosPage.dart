import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/database/afiliados_database.dart';
import 'package:secedo_unap/src/model/afiliados_model.dart';
import 'package:secedo_unap/src/pages/beneficiarios_afiliado.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/responsive.dart';

class AfiliadosPage extends StatefulWidget {
  const AfiliadosPage({
    Key key,
  }) : super(key: key);

  @override
  _AfiliadosPageState createState() => _AfiliadosPageState();
}

class _AfiliadosPageState extends State<AfiliadosPage> {
  TextEditingController _controllerBusquedaNegocio = TextEditingController();

  @override
  void dispose() {
    _controllerBusquedaNegocio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final afiliadosBloc = ProviderBloc.afiliados(context);
    afiliadosBloc.obtenerAfiliados();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BackButton(),
                  Expanded(
                    child: TextField(
                      controller: _controllerBusquedaNegocio,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'nombre   ',
                        hintStyle: TextStyle(
                          fontSize: responsive.ip(1.6),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.all(12),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[300]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[300]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onChanged: (valor) {
                        print(valor);

                        if (valor.length > 0) {
                          afiliadosBloc.consultaPersonal('$valor');
                        } else {
                          afiliadosBloc.obtenerAfiliados();
                        }
                      },
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _controllerBusquedaNegocio.text = '';
                        afiliadosBloc.obtenerAfiliados();
                      }),
                  SizedBox(
                    width: responsive.wp(3),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: afiliadosBloc.afiliadoStream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<AfiliadosModel>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 0) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _submit('${snapshot.data[index].dni}');
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          vertical: responsive.hp(1),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: responsive.wp(5),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${snapshot.data[index].nombrePersona} ${snapshot.data[index].apellidoPaterno} ${snapshot.data[index].apellidoMaterno}'),
                                                Text(
                                                    'Dni: ${snapshot.data[index].dni}'),
                                              ],
                                            ),
                                            Spacer(),
                                            SizedBox(
                                              width: responsive.wp(5),
                                            ),
                                            SizedBox(
                                              width: responsive.wp(5),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider()
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  } else {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _submit(String dni) async {
    final afiliadosDatabase = AfiliadosDatabase();

    final usuario = await afiliadosDatabase.cargarAfiliadoPorDni('$dni');

    if (usuario.length > 0) {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) {
            return BeneficiariosAfiliados(idPersona: usuario[0].idPersona);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
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

  
  }
}
