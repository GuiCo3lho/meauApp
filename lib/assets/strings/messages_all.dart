// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';

final _$pt_BR = $pt_BR();

class $pt_BR extends MessageLookupByLibrary {
  get localeName => 'pt_BR';
  
  final messages = {
		"ola" : MessageLookupByLibrary.simpleMessage("Olá"),
		"textoBemVindo" : MessageLookupByLibrary.simpleMessage("Bem vindo ao Meau!\nAqui você pode adotar, doar e ajudar\ncães e gatos com facilidade.\nQual o seu interesse?"),
		"adotar" : MessageLookupByLibrary.simpleMessage("Adotar"),
		"ajudar" : MessageLookupByLibrary.simpleMessage("Ajudar"),
		"cadastrarAnimal" : MessageLookupByLibrary.simpleMessage("Cadastrar Animal"),
		"login" : MessageLookupByLibrary.simpleMessage("login"),
		"nomeApp" : MessageLookupByLibrary.simpleMessage("Meau App"),
		"cadastroAnimal" : MessageLookupByLibrary.simpleMessage("Cadastro de Animal"),
		"tenhoInteresse" : MessageLookupByLibrary.simpleMessage("Tenho interesse em cadastrar o animal para:"),
		"adocao" : MessageLookupByLibrary.simpleMessage("Adoção"),
		"apadrinhar" : MessageLookupByLibrary.simpleMessage("Apadrinhar"),
		"ajuda" : MessageLookupByLibrary.simpleMessage("Ajuda"),
		"nomeAnimal" : MessageLookupByLibrary.simpleMessage("Nome do Animal"),
		"fotosAnimal" : MessageLookupByLibrary.simpleMessage("Fotos do Animal"),
		"adicionarFotos" : MessageLookupByLibrary.simpleMessage("Adicionar Fotos"),
		"especie" : MessageLookupByLibrary.simpleMessage("Espécie"),
		"cachorro" : MessageLookupByLibrary.simpleMessage("Cachorro"),
		"gato" : MessageLookupByLibrary.simpleMessage("Gato"),
		"sexo" : MessageLookupByLibrary.simpleMessage("sexo"),
		"macho" : MessageLookupByLibrary.simpleMessage("Macho"),
		"femea" : MessageLookupByLibrary.simpleMessage("Fêmea"),
		"porte" : MessageLookupByLibrary.simpleMessage("porte"),
		"pequeno" : MessageLookupByLibrary.simpleMessage("Pequeno"),
		"medio" : MessageLookupByLibrary.simpleMessage("Médio"),
		"grande" : MessageLookupByLibrary.simpleMessage("Grande"),
		"idade" : MessageLookupByLibrary.simpleMessage("idade"),
		"filhote" : MessageLookupByLibrary.simpleMessage("filhote"),
		"adulto" : MessageLookupByLibrary.simpleMessage("adulto"),
		"idoso" : MessageLookupByLibrary.simpleMessage("idoso"),
		"temperamento" : MessageLookupByLibrary.simpleMessage("temperamento"),
		"brincalhao" : MessageLookupByLibrary.simpleMessage("Brincalhão"),
		"timido" : MessageLookupByLibrary.simpleMessage("timido"),
		"calmo" : MessageLookupByLibrary.simpleMessage("calmo"),
		"guarda" : MessageLookupByLibrary.simpleMessage("guarda"),
		"amoroso" : MessageLookupByLibrary.simpleMessage("amoroso"),
		"preguicoso" : MessageLookupByLibrary.simpleMessage("Preguiçoso"),
		"saude" : MessageLookupByLibrary.simpleMessage("Saúde"),
		"vacinado" : MessageLookupByLibrary.simpleMessage("Vacinado"),
		"vermifugado" : MessageLookupByLibrary.simpleMessage("Vermifugado"),
		"castrado" : MessageLookupByLibrary.simpleMessage("Castrado"),
		"doente" : MessageLookupByLibrary.simpleMessage("doente"),
		"doencasAnimal" : MessageLookupByLibrary.simpleMessage("Doenças do Animal"),
		"exigenciasAdocao" : MessageLookupByLibrary.simpleMessage("Exigências para adoção"),
		"termoAdocao" : MessageLookupByLibrary.simpleMessage("Termo de Adoção"),
		"fotosCasa" : MessageLookupByLibrary.simpleMessage("Fotos da casa"),
		"visitaPrevia" : MessageLookupByLibrary.simpleMessage("Visita prévia ao Animal"),
		"acompanhamentoPos" : MessageLookupByLibrary.simpleMessage("Acompanhamento pós adoção"),
		"mes" : MessageLookupByLibrary.simpleMessage("mês"),
		"meses" : MessageLookupByLibrary.simpleMessage("meses"),
		"sobreAnimal" : MessageLookupByLibrary.simpleMessage("Sobre o animal"),
		"compartilheHistoria" : MessageLookupByLibrary.simpleMessage("Compartilhe a história do animal"),
		"colocarParaAdocao" : MessageLookupByLibrary.simpleMessage("Colocar para adoção"),
		"ops" : MessageLookupByLibrary.simpleMessage("Ops!"),
		"entrar" : MessageLookupByLibrary.simpleMessage("Entrar"),
		"nomeUsuario" : MessageLookupByLibrary.simpleMessage("Nome de usuário"),
		"senha" : MessageLookupByLibrary.simpleMessage("Senha"),
		"entrarCom" : MessageLookupByLibrary.simpleMessage("Entrar com"),

  };
}



typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
	"pt_BR": () => Future.value(null),

};

MessageLookupByLibrary _findExact(localeName) {
  switch (localeName) {
    case "pt_BR":
        return _$pt_BR;

    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
      localeName,
          (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? Future.value(false) : lib());

  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);

  return Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary _findGeneratedMessagesFor(locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
