import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meau_app/model/meauapp_context.dart';
import 'package:meau_app/model/pessoa.dart';
import 'package:meau_app/utils/meau_cores.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // FIXME: Apenas utilizar na apresentação ou quando não tiver alguma operação custosa de banco e etc.
    verificaLogin();
  }

  verificaLogin() async {
    Future(() async {
      FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();

      if (currentUser != null) {
        if (MeauAppContext.instance.usuarioLogado == null) {
          DocumentSnapshot document = await Firestore.instance
              .collection("pessoas")
              .document(currentUser.uid)
              .get();
          MeauAppContext.instance.usuarioLogado =
              Pessoa.fromJson(document.data);
        }

        Navigator.of(context).pushReplacementNamed("/listaAnimais");
      } else {
        Navigator.of(context).pushReplacementNamed("/telainicial");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            color: Cores.azulForte,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage("lib/assets/images/meau_malha.png"),
              color: Colors.white.withOpacity(0.65),
            ),
          ),
          Center(
            child: Container(
              height: 100,
              width: 276,
              child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage("lib/assets/images/meau_marca1.png")),
            ),
          )
        ],
      ),
    );
  }
}
