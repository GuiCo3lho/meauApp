import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meau_app/utils/meau_temas.dart';
import 'package:meau_app/utils/meau_util.dart';

class ListaAnimaisScreen extends StatefulWidget {

  @override
  _ListaAnimaisScreenState createState() => _ListaAnimaisScreenState();
}

class _ListaAnimaisScreenState extends State<ListaAnimaisScreen> {
  final _scaffKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    verificaLogin();
    super.initState();
  }

  void verificaLogin() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    _scaffKey.currentState.showSnackBar(
        SnackBar(content: Text("Você logou como: ${currentUser.email}")));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // retira label de debug
        debugShowCheckedModeBanner: false,
        title: "Adotar",
        theme: MeauTheme.getMeauThemeData(),
        home: Scaffold(
          key: _scaffKey,
          drawer: Util.createMeauDrawer(context),
          appBar: Util.createAppBar("Adotar"),
          body: ListView.builder(
            itemBuilder: _itemBuilder,
            itemCount: 20,
          ),
        ));
  }
}

Widget _itemBuilder(BuildContext context, int index) {
  return _createMockup(index);
}

// TODO: Deletar. Apenas para teste
Widget _createMockup(int indice) {
  const tamanhoDaLista = 6;
  List<String> nomes = ["Pequi", "Bidu", "Alec", "Pimpo", "Golias", "Sherlock"];
  List<String> imagem = [
    "lib/assets/images/cachorro_1.jpg",
    "lib/assets/images/gato_1.jpg",
    "lib/assets/images/cachorro_2.jpg",
    "lib/assets/images/gato_2.jpg"
  ];
  List<String> sexo = ["MACHO", "FEMEA"];
  List<String> idade = ["ADULTO", "PEQUENO", "MÉDIO"];
  List<String> endereco = [
    "SAMAMBAIA SUL - DISTRITO FEDERAL",
    "LAGO NORTE - DISTRITO FEDERAL",
    "ASA SUL - DISTRITO FEDERAL",
    'LAGO SUL - DISTRITO FEDERAL'
  ];

  return Util.createMeauCard(
      nomes.elementAt(indice % nomes.length),
      () {},
      AssetImage(imagem.elementAt(indice % imagem.length)),
      sexo.elementAt(sexo.length - 1),
      idade.elementAt(indice % idade.length),
      idade.elementAt(indice % idade.length),
      endereco.elementAt(indice % endereco.length));
}
