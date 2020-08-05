import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meau_app/utils/meau_cores.dart';
import 'package:meau_app/utils/meau_temas.dart';
import 'package:meau_app/utils/meau_util.dart';

class PerfilAnimalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MeauTheme.getMeauThemeData(),
      home: Scaffold(
        appBar: Util.createAppBar("Bidu"),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Util.createFieldLabel("Bidu",
                textColor: Cores.pretoForte,
                fontSize: 16,
                fontWeight: FontWeight.w500)
          ],
        )),
      ),
    );
  }
}
