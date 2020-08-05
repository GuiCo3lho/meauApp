import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meau_app/view/cadastro_animal/cadastro_animal_screen.dart';
import 'package:meau_app/view/cadastro_animal/lista_animais_screen.dart';
import 'package:meau_app/view/cadastro_animal/perfil_animal_screen.dart';
import 'package:meau_app/view/cadastro_pessoal/cadastro_pessoal_screen.dart';
import 'package:meau_app/view/cadastro_pessoal/login_screen.dart';
import 'package:meau_app/view/config/privacidade_widget.dart';
import 'package:meau_app/view/introducao/splashscreen.dart';
import 'package:meau_app/view/introducao/tela_inicial_screen.dart';
import 'package:meau_app/utils/meau_temas.dart';
import 'package:meau_app/assets/strings/i18n.dart';
import 'package:meau_app/view/cadastro_pessoal/perfil_pessoal.dart';
import 'package:meau_app/view/testFirebase/Setup/signin.dart';

void main() => runApp(MeauApp());

class MeauApp extends StatelessWidget {

  const MeauApp({
    Key key,
    @required this.user
  }) : super(key: key);
  final FirebaseUser user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Configuração para utilizar assets/strings
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Locale('pt', 'BR'),
        // ---
        theme: MeauTheme.getMeauThemeData(),


        debugShowCheckedModeBanner: false,
        title: "Meau App",
        routes: {
          '/telainicial': (context) => TelaInicialScreen(),
          '/cadastroAnimal': (context) => CadastroAnimalScreen(),
          '/login': (context) => LoginScreen(),
          '/listaAnimais': (context) => ListaAnimaisScreen(),
          '/perfilAnimal': (context) => PerfilAnimalScreen(),
          '/cadastroPessoal': (context) => CadastroPessoalScreen(),
          '/privacidadeScreen' : (context) => PrivacidadeWidget(),
          '/perfilPessoal' : (context) => PerfilPessoalScreen(),
          '/telaLogin' : (context) => LoginPage(),
        },
        home: SplashScreen());
  }
}


