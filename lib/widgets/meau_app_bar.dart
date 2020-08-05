import 'package:flutter/material.dart';
import 'package:meau_app/utils/meau_cores.dart';

class MeauAppBar extends AppBar {
  MeauAppBar(String texto)
      : super(
            title: Text(texto, style: TextStyle(color: Cores.pretoForte)),
            backgroundColor: Cores.amareloEscuro);
}
