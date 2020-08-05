import 'package:flutter/material.dart';
import 'package:meau_app/widgets/meau_app_bar.dart';

// Quase certeza que será um StatefulWidget...
// veremos mais na frente isso...
class CadastroScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // retira label de debug
      debugShowCheckedModeBanner: false,
      title: "Cadastro",
      home: Scaffold(
          appBar: MeauAppBar("Cadastro"),
        body: Center(
          child: Text("Tela de cadastro")
        ),
      ),
    );
  }
}