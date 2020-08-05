// fluxo:

// this => adotar
//      => cadastrar animal
//      => login (verificar login) => cadastro pessoal  => confirmação => listagem de animais

import 'package:flutter/material.dart';
import 'package:meau_app/assets/strings/i18n.dart';
import 'package:meau_app/utils/meau_cores.dart';
import 'package:meau_app/utils/meau_util.dart';

class TelaInicialScreen extends StatelessWidget {
  final String boasVindas =
      "Bem vindo ao Meau!\nAqui você pode adotar, doar e ajudar\ncães e gatos com facilidade.\nQual o seu interesse?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Util.createMeauDrawer(context),
      body: Container(
        color: Cores.cinzaMaisFraco,
        child: Column(
          children: <Widget>[
            Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsets.only(top: 20),
                child: IconButton(
                  iconSize: 24.0,
                  color: Cores.azulForte,
                  icon: Icon(Icons.menu),
                  onPressed: () => print("Teste"),
                )),
            Container(
              margin: EdgeInsets.only(top: 22, bottom: 20),
              child: Text(
                "Olá!",
                style: TextStyle(
                    fontFamily: "Courgette",
                    fontSize: 72,
                    color: Cores.amareloForte),
              ),
            ),
            Center(
                child: Text(
              boasVindas,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Roboto", fontSize: 16, color: Cores.pretoFraco),
            )),
            Expanded(
              child: Container(
                width: 200,
                margin: EdgeInsets.only(top: 35),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Util.createRaisedButton(
                          S.of(context).adotar.toUpperCase(), () => print(""),
                          padding: 65.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Util.createRaisedButton("AJUDAR", () => print(""),
                          padding: 65.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Util.createRaisedButton(
                          "CADASTRAR ANIMAL",
                          () => Navigator.of(context)
                              .pushNamed("/cadastroAnimal"),
                          padding: 29.5),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 18),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed("/login"),
                          child: Text(
                            "login",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Cores.azulForte,
                                fontFamily: "Roboto"),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Image(
                        image: AssetImage("lib/assets/images/meau_marca2.png"),
                        width: 122,
                        height: 44.0,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
