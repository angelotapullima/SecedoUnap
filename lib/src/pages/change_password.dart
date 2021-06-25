import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:secedo_unap/src/api/login_api.dart';
import 'package:secedo_unap/src/utils/responsive.dart';
import 'package:secedo_unap/src/utils/extentions.dart';
import 'package:secedo_unap/src/utils/utils.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _cargando = ValueNotifier<bool>(false);
  TextEditingController _oldController = TextEditingController();
  TextEditingController _newController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

  bool validateOldPass = false;
  bool validateNewPass = false;
  bool validateConfirm = false;

  FocusNode _focusNew = FocusNode();
  FocusNode _focusOld = FocusNode();
  FocusNode _focusConfirm = FocusNode();
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: _cargando,
          builder: (BuildContext context, bool dataToque, Widget child) {
            return Stack(
              children: [
                SafeArea(
                  child: KeyboardActions(
                    tapOutsideToDismiss: true,
                    config: KeyboardActionsConfig(
                        keyboardSeparatorColor: Colors.white,
                        keyboardBarColor: Colors.white,
                        actions: [
                          KeyboardActionsItem(focusNode: _focusOld),
                          KeyboardActionsItem(focusNode: _focusNew),
                          KeyboardActionsItem(focusNode: _focusConfirm),
                        ]),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.wp(3),
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [BackButton()],
                              ),
                              Text(
                                'Cambio de contraseña',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: responsive.ip(2.2),
                                ),
                              ),
                              SizedBox(
                                height: responsive.hp(3),
                              ),
                              Text(
                                'Contraseña Actual',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: responsive.ip(1.8),
                                    fontWeight: FontWeight.bold),
                              ),
                              _oldPass(responsive),
                              SizedBox(
                                height: responsive.hp(2),
                              ),
                              Text(
                                'Nueva contraseña',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: responsive.ip(1.8),
                                    fontWeight: FontWeight.bold),
                              ),
                              _newPass(responsive),
                              SizedBox(
                                height: responsive.hp(2),
                              ),
                              Text(
                                'Confirma la contraseña',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: responsive.ip(1.8),
                                    fontWeight: FontWeight.bold),
                              ),
                              _confirmPass(responsive),
                              SizedBox(
                                height: responsive.hp(2),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: () async {
                                      if (_newController.text.length <= 5) {
                                        validateNewPass = true;
                                      } else {
                                        validateNewPass = false;
                                      }

                                      if (_oldController.text.length <= 0) {
                                        validateOldPass = true;
                                      } else {
                                        validateOldPass = false;
                                      }

                                      if (_confirmController.text.length <= 5) {
                                        validateConfirm = true;
                                      } else {
                                        validateConfirm = false;
                                      }

                                      if (!validateNewPass) {
                                        if (!validateOldPass) {
                                          if (!validateConfirm) {
                                            if (_newController.text ==
                                                _confirmController.text) {
                                              _cargando.value = true;

                                              final loginApi = LoginApi();

                                              final res =
                                                  await loginApi.changePassword(
                                                      _oldController.text,
                                                      _newController.text,
                                                      _confirmController.text);

                                              if (res) {
                                                showToast1(
                                                    'Contraseña modificada correctamente',
                                                    1,
                                                    ToastGravity.BOTTOM);

                                                Navigator.pop(context);
                                              } else {
                                                showToast1(
                                                    'Ocurrio un error , intentelo nuevamente',
                                                    1,
                                                    ToastGravity.BOTTOM);
                                              }
                                              _cargando.value = false;
                                            } else {
                                              showToast1(
                                                  'las contraseñas deben ser iguales',
                                                  1,
                                                  ToastGravity.BOTTOM);
                                            }
                                          }
                                        }
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: responsive.wp(3),
                                        vertical: responsive.hp(.8),
                                      ),
                                      child: Text(
                                        'Cambiar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: responsive.ip(1.7),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[900],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                (dataToque)
                    ? Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: responsive.wp(10),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: responsive.wp(10),
                          ),
                          width: double.infinity,
                          height: responsive.hp(13),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: responsive.wp(10),
                              vertical: responsive.wp(6),
                            ),
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

  TextField _oldPass(Responsive responsive) {
    return TextField(
      focusNode: _focusOld,
      cursorColor: Colors.transparent,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorText:
              validateOldPass ? 'Por favor ingrese la contraseña actual' : null,
          contentPadding: EdgeInsets.symmetric(
            vertical: responsive.hp(1),
            horizontal: responsive.wp(4),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintStyle: TextStyle(color: Colors.black45),
          hintText: 'Contraseña Actual'),
      enableInteractiveSelection: false,
      controller: _oldController,
      //controller: montoPagarontroller,
    );
  }

  TextField _newPass(Responsive responsive) {
    return TextField(
      focusNode: _focusNew,
      cursorColor: Colors.transparent,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorText:
              validateNewPass ? 'la nueva contraseña debe tener mas de 6 dígitos' : null,
          contentPadding: EdgeInsets.symmetric(
            vertical: responsive.hp(1),
            horizontal: responsive.wp(4),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintStyle: TextStyle(color: Colors.black45),
          hintText: 'Nueva Contraseña'),
      enableInteractiveSelection: false,
      controller: _newController,
      //controller: montoPagarontroller,
    );
  }

  TextField _confirmPass(Responsive responsive) {
    return TextField(
      focusNode: _focusConfirm,
      cursorColor: Colors.transparent,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorText:
              validateConfirm ? 'la nueva contraseña debe tener mas de 6 dígitos' : null,
          contentPadding: EdgeInsets.symmetric(
            vertical: responsive.hp(1),
            horizontal: responsive.wp(4),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          hintStyle: TextStyle(color: Colors.black45),
          hintText: 'Confirmar contraseña'),
      enableInteractiveSelection: false,
      controller: _confirmController,
      //controller: montoPagarontroller,
    );
  }
}
