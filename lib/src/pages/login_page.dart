import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:secedo_unap/src/bloc/login_bloc.dart';
import 'package:secedo_unap/src/bloc/provider_bloc.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _cargando = ValueNotifier<bool>(false);
  bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final loginBloc = ProviderBloc.login(context);

    /* final api = AfiliadosApi();
    api.obtenerAfiliados(); */
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: _cargando,
          builder: (BuildContext context, bool dataToque, Widget child) {
            return Stack(
              children: [
                _form(context, responsive, loginBloc),
                (dataToque)
                    ? Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: responsive.wp(10)),
                          padding: EdgeInsets.symmetric(
                              horizontal: responsive.wp(10)),
                          width: double.infinity,
                          height: responsive.hp(13),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: responsive.wp(10),
                                vertical: responsive.wp(6)),
                            height: responsive.ip(4),
                            width: responsive.ip(4),
                            child: Image(
                                image: AssetImage('assets/loading.gif'),
                                fit: BoxFit.contain),
                          ),
                        ),
                      )
                    : Container()
              ],
            );
          }),
    );
  }

  Widget _form(
      BuildContext context, Responsive responsive, LoginBloc loginBloc) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: responsive.hp(8),
              ),
              Container(
                height: responsive.hp(25),
                child: Image.asset(
                  'assets/secedo.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: responsive.hp(5),
              ),
              Text(
                "Bienvenido",
                style: TextStyle(
                    fontSize: responsive.ip(3), fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: responsive.ip(2),
                ),
                child: Text(
                  "Inicie Sesión",
                  style: TextStyle(
                    fontSize: responsive.ip(2.5),
                  ),
                ),
              ),
              _email(loginBloc, responsive),
              _pass(loginBloc, responsive),
              _botonLogin(context, loginBloc, responsive),
              //verAfiliados(responsive),
            ],
          ),
        ),
      ),
    );
  }

  Widget _email(LoginBloc bloc, Responsive responsive) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: responsive.hp(2),
            left: responsive.wp(6),
            right: responsive.wp(6),
          ),
          child: TextField(
            textAlign: TextAlign.left,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                fillColor: Theme.of(context).dividerColor,
                hintText: 'Ingrese su nickname',
                hintStyle: TextStyle(
                    fontSize: responsive.ip(1.8),
                    fontFamily: 'Montserrat',
                    color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.all(
                  responsive.ip(2),
                ),
                errorText: snapshot.error,
                suffixIcon: Icon(
                  Icons.alternate_email,
                  color: Color(0xFFF93963),
                )),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _pass(LoginBloc bloc, Responsive responsive) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: responsive.hp(2),
            left: responsive.wp(6),
            right: responsive.wp(6),
          ),
          child: TextField(
            obscureText: _passwordVisible,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: Theme.of(context).dividerColor,
              hintText: 'Ingrese su contraseña',
              hintStyle: TextStyle(
                  fontSize: responsive.ip(1.8),
                  fontFamily: 'Montserrat',
                  color: Colors.black54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              contentPadding: EdgeInsets.all(
                responsive.ip(2),
              ),
              errorText: snapshot.error,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (_passwordVisible) {
                      _passwordVisible = false;
                    } else {
                      _passwordVisible = true;
                    }
                  });
                },
                icon: _passwordVisible
                    ? Icon(
                        Icons.visibility,
                        color: Colors.pink,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Colors.pink,
                      ),
              ),
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _botonLogin(
      BuildContext context, LoginBloc bloc, Responsive responsive) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: responsive.hp(2),
            left: responsive.wp(6),
            right: responsive.wp(6),
          ),
          child: SizedBox(
            width: double.infinity,
            height: responsive.ip(5),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(0.0),
              child: Text('Iniciar Sesión'),
              color: (snapshot.hasData) ? Colors.pink : Colors.grey,
              textColor: Colors.white,
              onPressed:
                  (snapshot.hasData) ? () => _submit(context, bloc) : () {},
            ),
          ),
        );
      },
    );
  }

  /* Widget verAfiliados(Responsive responsive) {
    return Padding(
      padding: EdgeInsets.only(
        top: responsive.hp(2),
        left: responsive.wp(6),
        right: responsive.wp(6),
      ),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.all(0.0),
          child: Text('verAfiliados'),
          color: Color(0xFFF93963),
          textColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return AfiliadosPage();
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
          },
        ),
      ),
    );
  }

  */
  _submit(BuildContext context, LoginBloc bloc) async {
    /*  final afiliadosDatabase = AfiliadosDatabase();

    final prefs = new Preferences();
    //final afiliadosApi = AfiliadosApi();
    _cargando.value = true;

    final usuario =
        await afiliadosDatabase.cargarAfiliadoPorDni('${bloc.email}');

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
    } else {
      showToast1('error', 5, ToastGravity.BOTTOM);
    }
 */
    _cargando.value = true;
    final bool code = await bloc.login('${bloc.email}', '${bloc.password}');

    if (code) {
      print(code);

      Navigator.of(context)
          .pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);

      // Navigator.pushReplacementNamed(context, 'home');
    } else {
      print(code);
      showToast1('Datos incorrectos', 2, ToastGravity.CENTER);
    }

    _cargando.value = false;
  }
}
