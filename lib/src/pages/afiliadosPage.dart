 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/model/afiliados_model.dart';
import 'package:secedo_unap/src/utils/responsive.dart'; 

class AfiliadosPage extends StatefulWidget {
  const AfiliadosPage(
      {Key key,  })
      : super(key: key);
 

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
                        hintText: 'personal',
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
                          return Column(
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
}
