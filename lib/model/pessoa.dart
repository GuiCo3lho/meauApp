import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:meau_app/model/animal.dart';

part 'pessoa.g.dart';

// OBS: Caso seja feita alguma modificação nesse documento, rodar:
// flutter pub run build_runner build
// Irá reconstroir o arquivo pessoa.g.dart

@JsonSerializable(explicitToJson: true, createToJson: true)
class Pessoa {
  factory Pessoa.fromJson(Map<String, dynamic> json) => _$PessoaFromJson(json);
  Map<String, dynamic> toJson() => _$PessoaToJson(this);

  Pessoa(
      {this.id,
      this.nomeCompleto,
      this.foto,
      this.idade,
      this.email,
      this.estado,
      this.cidade,
      this.endereco,
      this.telefone,
      this.nomeUsuario,
      this.senha,
      this.meusAnimais,
      this.animaisFavoritados,
      this.animaisAdocao});

  @JsonKey(includeIfNull: false, nullable: true)
  String id;

  @JsonKey(includeIfNull: false)
  String nomeCompleto;

  @JsonKey(ignore: true)
  File foto;

  @JsonKey(includeIfNull: false)
  int idade;

  @JsonKey(includeIfNull: false)
  String email;

  @JsonKey(includeIfNull: false)
  String estado;

  @JsonKey(includeIfNull: false)
  String cidade;

  @JsonKey(includeIfNull: false)
  String endereco;

  @JsonKey(includeIfNull: false)
  String telefone;

  @JsonKey(includeIfNull: false)
  String nomeUsuario;

  @JsonKey(includeIfNull: false)
  String senha;

  // Animais no qual a pessoa cadastrou
  @JsonKey(includeIfNull: false)
  List<Animal> meusAnimais = List();

  // Animais no qual a pessoa favoritou
  @JsonKey(includeIfNull: false)
  List<Animal> animaisFavoritados = List();

  // Animais no qual a pessoa adatou
  @JsonKey(includeIfNull: false)
  List<Animal> animaisAdocao= List();
}
