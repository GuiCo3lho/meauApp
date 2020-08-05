import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meau_app/utils/meau_cores.dart';
import 'package:meau_app/utils/meau_util.dart';

class PrivacidadeWidget extends StatelessWidget {



  final String TextUm =
      "Com as notificações de chat ativadas, você sempre receberá um aviso em seu celular quando alguém entrar em contato através do aplicativo.";

  final String TextDois =
      "Com as notificações de recordação ativadas, você será sempre lembrado de entrar em contato como doador (caso você adote um animal) a fim decumprir o requisito de acompanhamento pós adoção.";

  final String TextTres =
      "Com as notificações de eventos ativadas, você sempre receberá uma notificação para lembrá-lo dos eventos da semana.";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: Util.createMeauDrawer(context),
      appBar: AppBar(
        title: new Text("Privacidade", style: TextStyle(color: Colors.black)),
        backgroundColor: Cores.cinzaFraco,
      ),
      body: new Container(
          padding: new EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Util.createFieldLabel("NOTIFICAÇÕES",
                  textColor: Cores.pretoForte),
              // Util.createNCheckBoxColumn([
              //   "Ativar notificações de chat",
              //   "Ativar notificações de recordações",
              //   "Ativar notificações de eventos"
              // ], [
              //   null,
              //   null,
              //   null
              // ]),
              Util.createFieldLabel(TextUm, textColor: Cores.pretoForte),
              Util.createFieldLabel(TextDois, textColor: Cores.pretoForte),
              Util.createFieldLabel(TextTres, textColor: Cores.pretoForte),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 70.0),
                  child: Util.createRaisedButton(
                      "SALVAR ALTERAÇÕES", () => Navigator.of(context).pushNamed("/telainicial")
                ),
              ),





















                )],
          ),
      ),
    );
  }
}
