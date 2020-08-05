import 'package:flutter/material.dart';
import 'package:meau_app/view/cadastro_animal/adocao_widget.dart';
import 'package:meau_app/utils/meau_temas.dart';
import 'package:meau_app/utils/meau_util.dart';

class CadastroAnimalScreen extends StatefulWidget {
  @override
  _CadastroAnimalScreenState createState() => _CadastroAnimalScreenState();
}

enum MenuAnimalType { ADOCAO, APADRINHAR, AJUDAR }

class _CadastroAnimalScreenState extends State<CadastroAnimalScreen> {
  bool isAdocaoVisible = true,
      isApadrinharVisible = false,
      isAjudarVisible = false;

  selecionar(MenuAnimalType menu) {
    switch (menu) {
      case MenuAnimalType.ADOCAO:
        setState(() => isAdocaoVisible = !isAdocaoVisible);
        break;
      case MenuAnimalType.APADRINHAR:
        setState(() => isApadrinharVisible = !isApadrinharVisible);
        break;
      case MenuAnimalType.AJUDAR:
        setState(() => isAjudarVisible = !isAjudarVisible);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // retira label de debug
        debugShowCheckedModeBanner: false,
        title: "Cadastro",
        theme: MeauTheme.getMeauThemeData(),
        home: Scaffold(
            appBar: Util.createAppBar("Cadastro"),
            body: ListView(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                        child: Text(
                            "Tenho interesse em cadastrar o animal para: "))),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 24.0)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Util.createStatefulRaisedButton(
                            "ADOÇÃO", selecionar, MenuAnimalType.ADOCAO,
                            padding: 10.0, initialState: true)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Util.createStatefulRaisedButton(
                            "APADRINHAR", selecionar, MenuAnimalType.APADRINHAR,
                            padding: 10.0, initialState: false)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Util.createStatefulRaisedButton(
                            "AJUDA", selecionar, MenuAnimalType.APADRINHAR,
                            padding: 10.0, initialState: false)),
                  ],
                ),
                Divider(),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Column(children: <Widget>[
                      Visibility(
                          child: AdocaoWidget(), visible: isAdocaoVisible),
                    ])),
              ],
            )));
  }
}
