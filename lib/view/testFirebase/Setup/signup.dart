import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meau_app/view/testFirebase/Setup/welcome.dart';
import 'package:meau_app/utils/meau_util.dart';
import 'package:meau_app/widgets/meau_raised_button_loading_widget.dart';
import 'package:meau_app/model/pessoa.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Pessoa _pessoa = Pessoa();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignUp Page'),
        ),
        body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Please type an email';
                    }
                  },
                  onSaved: (input) => this._pessoa.email = input,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  validator: (input) {
                    if (input.length < 6) {
                      return 'Atleast 6 characters!';
                    }
                  },
                  onSaved: (input) => this._pessoa.senha = input,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                Util.createTextFormField("Estado",
                    onSaved: (v) => this._pessoa.estado = v),
                Util.createTextFormField("Cidade",
                    onSaved: (v) => this._pessoa.cidade = v),
                MeauRaisedButtonLoading("Sign", () async {
                  if (this._formKey.currentState.validate()) {
                    this._formKey.currentState.save();
                    print("Formulário validado!");

                    try {
                      AuthResult result = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: this._pessoa.email,
                              password: this._pessoa.senha);
                      FirebaseUser user = result.user;

                      await Firestore.instance
                          .collection("users")
                          .document(user.uid)
                          .setData({
                        "id": user.uid,
                        "estado": this._pessoa.estado,
                        "cidade": this._pessoa.cidade,
                        "email": this._pessoa.email,
                      });
                      user.sendEmailVerification();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()));
                    } catch (e) {
                      print(e);
                    }
                  }
                })
              ],
            )));
  }
}
