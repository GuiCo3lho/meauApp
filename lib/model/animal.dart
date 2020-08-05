import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:meau_app/model/pessoa.dart';

part 'animal.g.dart';

// OBS: Caso seja feita alguma modificação nesse documento, rodar:
// flutter pub run build_runner build
// Irá reconstroir o arquivo animal.g.dart

enum TipoCadastro { ADOCAO, APADRINHAR, AJUDA }
enum TipoEspecie { CACHORRO, GATO }
enum Sexo { MACHO, FEMEA }
enum Porte { PEQUENO, MEDIO, GRANDE }
enum Idade { FILHOTE, ADULTO, IDOSO }
enum Temperamento { BRINCALHAO, TIMIDO, CALMO, GUARDA, AMOROSO, PREGUICOSO }
enum Saude { VACINADO, VERMIFUGADO, CASTRADO, DOENTE }
enum Exigencias { TERMO_ADOCAO, FOTOS_CASA, VISITA_PREVIA, ACOMPANHAMENTO_POS }
enum Acompanhamento { MES_1, MESES_3, MESES_6 }

@JsonSerializable(explicitToJson: true, createToJson: true, createFactory: true)
class Animal {
  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalToJson(this);

  Animal(
      {this.id,
      this.donoCadastrado,
      this.dono,
      this.tipoCadastro,
      this.nome,
      this.foto,
      this.especie,
      this.sexo,
      this.porte,
      this.idade,
      this.temperamento,
      this.saude,
      this.doencas,
      this.exigencias,
      this.acompanhamento,
      this.sobreAnimal});

  @JsonKey(includeIfNull: false, nullable: true)
  String id;

  // Esse é o usuário que cadastrou o animal. Ele nunca deverá mudar.
  @JsonKey(includeIfNull: false)
  Pessoa donoCadastrado;

  // Esse é o dono atual do animal. No cadastro será igal a donoCadastrado.
  // Porém, no decorrer do app esse dono se tornará a pessoa que adotou o cachorro.
  @JsonKey(includeIfNull: false)
  Pessoa dono;

  @JsonKey(includeIfNull: false)
  TipoCadastro tipoCadastro;

  @JsonKey(disallowNullValue: true)
  String nome;

  @JsonKey(includeIfNull: false, ignore: true)
  File foto;

  @JsonKey(includeIfNull: false)
  TipoEspecie especie;

  @JsonKey(includeIfNull: false)
  Sexo sexo;

  @JsonKey(includeIfNull: false)
  Porte porte;

  @JsonKey(includeIfNull: false)
  Idade idade;

  @JsonKey(includeIfNull: false)
  List<Temperamento> temperamento = List();

  @JsonKey(includeIfNull: false)
  List<Saude> saude = List();

  @JsonKey(includeIfNull: false)
  String doencas;

  @JsonKey(includeIfNull: false)
  List<Exigencias> exigencias = List();

  @JsonKey(includeIfNull: false)
  List<Acompanhamento> acompanhamento = List();

  @JsonKey(includeIfNull: false)
  String sobreAnimal;
}
