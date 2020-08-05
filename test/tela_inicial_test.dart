import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meau_app/view/introducao/tela_inicial_screen.dart';

void main() {
  testWidgets("Test home page of the app", (WidgetTester tester) async {
    await tester.pumpWidget(TelaInicialScreen());

    //final buttonsFinder = find.widgetWithText(RaisedButton());
   // final loginFinder = find.byWidget(GestureDetector());

    //expect(buttonsFinder, findsNWidgets(3));
    //expect(loginFinder, findsOneWidget);
  });
}
