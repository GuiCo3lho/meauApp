import 'package:flutter/material.dart';
import 'package:meau_app/widgets/meau_app_bar.dart';

// Quase certeza que será um StatefulWidget...
// veremos mais na frente isso...
class PerfilAnimalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;
    return MaterialApp(
      // retira label de debug
      debugShowCheckedModeBanner: false,
      title: "Perfil Animal",
      home: Scaffold(
        appBar: MeauAppBar("Perfil do Animal"),
        body: Center(
            child: Text("Perfil Animal")
        ),
      ),
    );
  }
}