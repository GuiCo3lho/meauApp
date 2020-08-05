import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meau_app/model/pessoa.dart';
import 'package:meau_app/utils/meau_temas.dart';
import 'package:meau_app/utils/meau_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meau_app/utils/meau_cores.dart';

class PerfilPessoalScreen extends StatefulWidget {
  @override
  _PerfilPessoalScreenState createState() => _PerfilPessoalScreenState();
}

class _PerfilPessoalScreenState extends State<PerfilPessoalScreen> {
  Pessoa _pessoa;

  Future<DocumentSnapshot> _buscaDados() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return Firestore.instance.collection("pessoas").document(user.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscaDados(),
        builder: (context, userFuture) {
          if (userFuture.connectionState == ConnectionState.done &&
              userFuture.hasData) {
            _pessoa = Pessoa.fromJson(userFuture.data.data);

            return MaterialApp(
                theme: MeauTheme.getMeauThemeData(isBlueTheme: true),
                home: Scaffold(
                    drawer: Util.createMeauDrawer(context),
                    appBar: AppBar(
                      title: Text(_pessoa.nomeCompleto ?? "Carregando...",
                          style: TextStyle(color: Colors.black)),
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    body: ListView(
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 20.0, left: 16.0),
                                    height: 180,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'lib/assets/images/profile.png')))),
                                Util.createFieldLabel(_pessoa.nomeCompleto,
                                    textColor: Cores.pretoForte,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                Util.createFieldLabel("IDADE",
                                    textColor: Cores.azulForte),
                                Util.createFieldLabel(_pessoa.idade.toString(),
                                    textColor: Cores.pretoForte),
                                Util.createFieldLabel("E-MAIL",
                                    textColor: Cores.azulForte),
                                Util.createFieldLabel(_pessoa.email,
                                    textColor: Cores.pretoForte),
                                Util.createFieldLabel("LOCALIZAÇÃO",
                                    textColor: Cores.azulForte),
                                Util.createFieldLabel(
                                    _pessoa.cidade + ',' + _pessoa.estado,
                                    textColor: Cores.pretoForte),
                                Util.createFieldLabel("ENDEREÇO",
                                    textColor: Cores.azulForte),
                                Util.createFieldLabel(_pessoa.endereco,
                                    textColor: Cores.pretoForte),
                                Util.createFieldLabel("TELEFONE",
                                    textColor: Cores.azulForte),
                                Util.createFieldLabel(_pessoa.telefone,
                                    textColor: Cores.pretoForte),
                                Util.createFieldLabel("Usuário",
                                    textColor: Cores.azulForte),
                                Util.createFieldLabel(_pessoa.nomeUsuario,
                                    textColor: Cores.pretoForte),
                                Util.createFieldLabel("HISTÓRICO",
                                    textColor: Cores.azulForte),
                                // TODO: Ainda não possui histórico na pessoa,
                                // mudar quando finalizar um processo.
                                // Util.createFieldLabel(snapshot.data['histórico'],
                                //     textColor: Cores.pretoForte)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )));
          }

          return Container(child: Text("Carregando..."));
        });
  }
}
//              return Text(snapshot.data['cidade']);
