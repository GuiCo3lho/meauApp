import 'package:flutter/material.dart';
import 'package:meau_app/utils/meau_cores.dart';

class MeauTheme {
  static ThemeData getMeauThemeData({bool isBlueTheme: false}) {
    return ThemeData(
        accentColor: isBlueTheme ? Cores.azulForte : Cores.amareloForte,
        primaryColor: isBlueTheme ? Cores.azulForte : Cores.amareloForte,
        brightness: Brightness.light,
        buttonTheme: getMeauButtonThemeData(
            buttonColor: isBlueTheme ? Cores.azulForte : Cores.amareloForte),
        fontFamily: "Roboto",
        appBarTheme: getMeauAppBarTheme(
            color: isBlueTheme ? Cores.azulForte : Cores.amareloForte),
        scaffoldBackgroundColor: Cores.cinzaMaisFraco,
        dialogBackgroundColor: Cores.cinzaMaisFraco,
        primaryTextTheme: getMeauTextTheme());
  }

  static TextTheme getMeauTextTheme() {
    return TextTheme(title: TextStyle(color: Cores.pretoForte));
  }

  static ButtonThemeData getMeauButtonThemeData(
      {Color buttonColor: Cores.amareloForte}) {
    return ButtonThemeData(
        buttonColor: buttonColor,
        disabledColor: Cores.cinzaFraco,
        padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0));
  }

  static AppBarTheme getMeauAppBarTheme({Color color: Cores.amareloForte}) {
    return AppBarTheme(color: color, brightness: Brightness.light);
  }

  static CardTheme getMeauCardTheme() {
    return CardTheme();
  }

  static TextStyle getMeauTextStyle(
      {String fontFamily: "Roboto",
      FontStyle fontStyle: FontStyle.normal,
      double fontSize: 14.0}) {
    return TextStyle(
        fontFamily: 'Roboto', fontSize: fontSize, fontStyle: FontStyle.normal);
  }
}
