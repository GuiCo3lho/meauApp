import 'package:flutter/material.dart';
import 'package:meau_app/utils/meau_cores.dart';
import 'package:meau_app/view/cadastro_animal/cadastro_animal_screen.dart';

class MeauRaisedButton extends StatefulWidget {
  final bool initialState;
  final String text;
  final double padding;
  final Function onPressed;
  final MenuAnimalType menuAnimalType;

  // TODO: Melhorar solução com stream builder.
  const MeauRaisedButton(this.text, this.onPressed, this.menuAnimalType,
      {Key key, this.padding: 40.0, this.initialState: false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MeauRaisedButtonState(text, padding, onPressed, menuAnimalType,
        isActive: initialState);
  }
}

class _MeauRaisedButtonState extends State<MeauRaisedButton> {
  bool isActive;
  final String text;
  final double padding;
  Function onPressed;
  final MenuAnimalType menuAnimalType;

  _MeauRaisedButtonState(
      this.text, this.padding, this.onPressed, this.menuAnimalType,
      {this.isActive: false});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: isActive ? Cores.amareloForte : Cores.cinzaEscuro,
      splashColor: Colors.transparent,
      highlightColor: isActive ? Cores.amareloForte : Cores.cinzaEscuro,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 12.0, color: Cores.pretoForte),
        ),
      ),
      onPressed: () {
        onPressed(menuAnimalType);
        setState(() => {isActive = !isActive});
      },
    );
  }
}