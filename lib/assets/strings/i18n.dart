// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'messages_all.dart';

class S {
 
  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }
  
  static Future<S> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new S();
    });
  }
  
  String get ola {
    return Intl.message("Olá", name: 'ola');
  }

  String get textoBemVindo {
    return Intl.message("Bem vindo ao Meau!\nAqui você pode adotar, doar e ajudar\ncães e gatos com facilidade.\nQual o seu interesse?", name: 'textoBemVindo');
  }

  String get adotar {
    return Intl.message("Adotar", name: 'adotar');
  }

  String get ajudar {
    return Intl.message("Ajudar", name: 'ajudar');
  }

  String get cadastrarAnimal {
    return Intl.message("Cadastrar Animal", name: 'cadastrarAnimal');
  }

  String get login {
    return Intl.message("login", name: 'login');
  }

  String get nomeApp {
    return Intl.message("Meau App", name: 'nomeApp');
  }

  String get cadastroAnimal {
    return Intl.message("Cadastro de Animal", name: 'cadastroAnimal');
  }

  String get tenhoInteresse {
    return Intl.message("Tenho interesse em cadastrar o animal para:", name: 'tenhoInteresse');
  }

  String get adocao {
    return Intl.message("Adoção", name: 'adocao');
  }

  String get apadrinhar {
    return Intl.message("Apadrinhar", name: 'apadrinhar');
  }

  String get ajuda {
    return Intl.message("Ajuda", name: 'ajuda');
  }

  String get nomeAnimal {
    return Intl.message("Nome do Animal", name: 'nomeAnimal');
  }

  String get fotosAnimal {
    return Intl.message("Fotos do Animal", name: 'fotosAnimal');
  }

  String get adicionarFotos {
    return Intl.message("Adicionar Fotos", name: 'adicionarFotos');
  }

  String get especie {
    return Intl.message("Espécie", name: 'especie');
  }

  String get cachorro {
    return Intl.message("Cachorro", name: 'cachorro');
  }

  String get gato {
    return Intl.message("Gato", name: 'gato');
  }

  String get sexo {
    return Intl.message("sexo", name: 'sexo');
  }

  String get macho {
    return Intl.message("Macho", name: 'macho');
  }

  String get femea {
    return Intl.message("Fêmea", name: 'femea');
  }

  String get porte {
    return Intl.message("porte", name: 'porte');
  }

  String get pequeno {
    return Intl.message("Pequeno", name: 'pequeno');
  }

  String get medio {
    return Intl.message("Médio", name: 'medio');
  }

  String get grande {
    return Intl.message("Grande", name: 'grande');
  }

  String get idade {
    return Intl.message("idade", name: 'idade');
  }

  String get filhote {
    return Intl.message("filhote", name: 'filhote');
  }

  String get adulto {
    return Intl.message("adulto", name: 'adulto');
  }

  String get idoso {
    return Intl.message("idoso", name: 'idoso');
  }

  String get temperamento {
    return Intl.message("temperamento", name: 'temperamento');
  }

  String get brincalhao {
    return Intl.message("Brincalhão", name: 'brincalhao');
  }

  String get timido {
    return Intl.message("timido", name: 'timido');
  }

  String get calmo {
    return Intl.message("calmo", name: 'calmo');
  }

  String get guarda {
    return Intl.message("guarda", name: 'guarda');
  }

  String get amoroso {
    return Intl.message("amoroso", name: 'amoroso');
  }

  String get preguicoso {
    return Intl.message("Preguiçoso", name: 'preguicoso');
  }

  String get saude {
    return Intl.message("Saúde", name: 'saude');
  }

  String get vacinado {
    return Intl.message("Vacinado", name: 'vacinado');
  }

  String get vermifugado {
    return Intl.message("Vermifugado", name: 'vermifugado');
  }

  String get castrado {
    return Intl.message("Castrado", name: 'castrado');
  }

  String get doente {
    return Intl.message("doente", name: 'doente');
  }

  String get doencasAnimal {
    return Intl.message("Doenças do Animal", name: 'doencasAnimal');
  }

  String get exigenciasAdocao {
    return Intl.message("Exigências para adoção", name: 'exigenciasAdocao');
  }

  String get termoAdocao {
    return Intl.message("Termo de Adoção", name: 'termoAdocao');
  }

  String get fotosCasa {
    return Intl.message("Fotos da casa", name: 'fotosCasa');
  }

  String get visitaPrevia {
    return Intl.message("Visita prévia ao Animal", name: 'visitaPrevia');
  }

  String get acompanhamentoPos {
    return Intl.message("Acompanhamento pós adoção", name: 'acompanhamentoPos');
  }

  String get mes {
    return Intl.message("mês", name: 'mes');
  }

  String get meses {
    return Intl.message("meses", name: 'meses');
  }

  String get sobreAnimal {
    return Intl.message("Sobre o animal", name: 'sobreAnimal');
  }

  String get compartilheHistoria {
    return Intl.message("Compartilhe a história do animal", name: 'compartilheHistoria');
  }

  String get colocarParaAdocao {
    return Intl.message("Colocar para adoção", name: 'colocarParaAdocao');
  }

  String get ops {
    return Intl.message("Ops!", name: 'ops');
  }

  String get entrar {
    return Intl.message("Entrar", name: 'entrar');
  }

  String get nomeUsuario {
    return Intl.message("Nome de usuário", name: 'nomeUsuario');
  }

  String get senha {
    return Intl.message("Senha", name: 'senha');
  }

  String get entrarCom {
    return Intl.message("Entrar com", name: 'entrarCom');
  }


}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
			Locale("pt", "BR"),

    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool isSupported(Locale locale) =>
    locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}
