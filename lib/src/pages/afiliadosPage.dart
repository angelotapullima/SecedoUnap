/*  
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/database/afiliados_database.dart';
import 'package:secedo_unap/src/model/afiliados_model.dart';
import 'package:secedo_unap/src/preferencias/preferencias_usuario.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/utils.dart'; 

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
                          return InkWell(
                            onTap: (){
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

  _submit( String dni) async {
    final afiliadosDatabase = AfiliadosDatabase();

    final prefs = new Preferences();
    //final afiliadosApi = AfiliadosApi();

    final usuario =
        await afiliadosDatabase.cargarAfiliadoPorDni('$dni');

    if (usuario.length > 0) {

      String ano;
      String yearAfi,mesAfi,diaAfi;

      String fechaNacimiento;
      var fechaNac = usuario[0].fechaNac;
      List fechexNac = fechaNac.split('T');
      fechaNacimiento = fechexNac[0].trim();
 

      var age = fechaNacimiento;
      List fechexAge = age.split('-');
      ano = fechexAge[0].trim();


      String fechaAfiliacion;
      var fechaAfi = usuario[0].fechaAfiliacion;
      List fechexAfi = fechaAfi.split('T');
      fechaAfiliacion = fechexAfi[0].trim();

       var fechaAfix = fechaAfiliacion;
      List fechinAfi = fechaAfix.split('-');
      yearAfi = fechinAfi[0].trim(); 
      mesAfi = fechinAfi[1].trim(); 
      diaAfi = fechinAfi[2].trim(); 

      String fechaNombramiento;
      var fechaNom = usuario[0].fechaNombramiento;
      List fechexNom = fechaNom.split('T');
      fechaNombramiento = fechexNom[0].trim();

      String fechaDesafiliacion;
      var fechaDes = usuario[0].fechaDesafiliacion;
      List fechexDes = fechaDes.split('T');
      fechaDesafiliacion = fechexDes[0].trim();
 
      prefs.yearNacimiento = ano;
      prefs.yearAfiliacion = yearAfi;
      prefs.mesAfiliacion = mesAfi;
      prefs.diaAfiliacion = diaAfi;
      prefs.idPersona = usuario[0].idPersona;
      prefs.idTipoPersonaDtipoPersona = usuario[0].idTipoPersonaDtipoPersona;
      prefs.idFacultadDfacultad = usuario[0].idFacultadDfacultad;
      prefs.codigo = usuario[0].codigo;
      prefs.nombrePersona = usuario[0].nombrePersona;
      prefs.apellidoPaterno = usuario[0].apellidoPaterno;
      prefs.apellidoMaterno = usuario[0].apellidoMaterno;
      prefs.direccion = usuario[0].direccion;
      prefs.telefono = usuario[0].telefono;
      prefs.celular = usuario[0].celular;
      prefs.correo = usuario[0].correo;
      prefs.imagen = usuario[0].imagen;
      prefs.nvecesPersona = usuario[0].nvecesPersona;
      prefs.fechaNombramiento = fechaNombramiento;
      prefs.dni = usuario[0].dni;
      prefs.cuentaBN = usuario[0].cuentaBN;
      prefs.fechaNac = fechaNacimiento;
      prefs.tipoPersona = usuario[0].tipoPersona;
      prefs.tipoAfiliado = usuario[0].tipoAfiliado;
      prefs.facultad = usuario[0].facultad;
      prefs.idAfiliacion = usuario[0].idAfiliacion;
      prefs.idPersonaDpersona = usuario[0].idPersonaDpersona;
      prefs.fechaAfiliacion = fechaAfiliacion;
      prefs.fechaCesantia = usuario[0].fechaCesantia;
      prefs.nveces = usuario[0].nveces;
      prefs.fechaDesafiliacion = fechaDesafiliacion;

      Navigator.of(context)
          .pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);
    } 

    /* final int code = await bloc.login('${bloc.email}', '${bloc.password}');

    if (code == 1) {
      print(code);

      Navigator.of(context)
          .pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);

      // Navigator.pushReplacementNamed(context, 'home');
    } else if (code == 2) {
      print(code);
      //showToast1('Ocurrio un error', 2, ToastGravity.CENTER);
    } else if (code == 3) {
      print(code);
      //showToast1('Datos incorrectos', 2, ToastGravity.CENTER);
    }
 */
  }
}
 */