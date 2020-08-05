import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meau_app/model/pessoa.dart';
import 'package:meau_app/utils/meau_cores.dart';
import 'package:meau_app/utils/meau_temas.dart';
import 'package:meau_app/utils/meau_util.dart';
import 'package:meau_app/widgets/meau_raised_button_loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Pessoa _pessoa = Pessoa();
  bool isErrorOcurred = false;
  String errorMessage = "mensagem";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MeauTheme.getMeauThemeData(isBlueTheme: true),
        title: "Login",
        home: Scaffold(
          // ! evita overflow com o teclado. Porém, é deprecated. Procurar outra solução.
          resizeToAvoidBottomPadding: false,
          appBar: Util.createAppBar("Login"),
          drawer: Util.createMeauDrawer(context),
          body: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 64),
            child: Form(
              key: this._formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      decoration: InputDecoration(hintText: "E-mail"),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onSaved: (v) => this._pessoa.email = v,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu e-mail para login";
                        }
                        return null;
                      }),
                  TextFormField(
                      decoration: InputDecoration(hintText: "Senha"),
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      onSaved: (v) => this._pessoa.senha = v,
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return "Insira sua senha para login";
                        }
                        return null;
                      }),
                  Visibility(
                    visible: isErrorOcurred,
                    child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                              fontFamily: "Roboto", color: Colors.red),
                        )),
                  ),
                  MeauRaisedButtonLoading("Login", () async {
                    if (this._formKey.currentState.validate()) {
                      this._formKey.currentState.save();

                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: this._pessoa.email,
                                password: this._pessoa.senha)
                            .then((result) {
                          Navigator.of(context)
                              .pushReplacementNamed("/listaAnimais");
                        });
                      } catch (e) {
                        if (Platform.isAndroid && e is PlatformException) {
                          switch (e.code) {
                            case "ERROR_INVALID_EMAIL":
                              setState(() {
                                isErrorOcurred = true;
                                errorMessage = "O e-mail é inválido!";
                              });
                              break;
                            case "ERROR_USER_NOT_FOUND":
                            case "ERROR_WRONG_PASSWORD":
                              setState(() {
                                isErrorOcurred = true;
                                errorMessage =
                                    "Não foi encontrado uma conta com essa combinação de e-mail e senha.";
                              });
                              break;
                            case "ERROR_TOO_MANY_REQUESTS":
                              setState(() {
                                isErrorOcurred = true;
                                errorMessage =
                                    "Muitas tentativas efetuadas. Tente novamente mais tarde.";
                              });
                              break;
                            default:
                              print(e);
                              break;
                          }
                        }
                      }
                    }
                  }),
                  Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Util.createRaisedButton(
                          "FAZER CADASTRO",
                          () => Navigator.of(context)
                              .pushNamed("/cadastroPessoal"),
                          padding: 65)),
                  Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Util.createCustomRaisedButton(
                            "ENTRAR COM FACEBOOK",
                            () => print(""),
                            Cores.azulEscuro,
                            fontColor: Cores.brancoFraco,
                            padding: 60,
                            icon: FontAwesomeIcons.facebookSquare),
                      )),
                  Container(
                    child: Util.createCustomRaisedButton("ENTRAR COM GOOGLE",
                        () => print(""), Cores.vermelhoRosado,
                        fontColor: Cores.brancoFraco,
                        padding: 60,
                        icon: FontAwesomeIcons.googlePlusG),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
