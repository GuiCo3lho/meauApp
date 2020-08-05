// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pessoa _$PessoaFromJson(Map<String, dynamic> json) {
  return Pessoa(
    id: json['id'] as String,
    nomeCompleto: json['nomeCompleto'] as String,
    idade: json['idade'] as int,
    email: json['email'] as String,
    estado: json['estado'] as String,
    cidade: json['cidade'] as String,
    endereco: json['endereco'] as String,
    telefone: json['telefone'] as String,
    nomeUsuario: json['nomeUsuario'] as String,
    senha: json['senha'] as String,
    meusAnimais: (json['meusAnimais'] as List)
        ?.map((e) =>
            e == null ? null : Animal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    animaisFavoritados: (json['animaisFavoritados'] as List)
        ?.map((e) =>
            e == null ? null : Animal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    animaisAdocao: (json['animaisAdocao'] as List)
        ?.map((e) =>
            e == null ? null : Animal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PessoaToJson(Pessoa instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('nomeCompleto', instance.nomeCompleto);
  writeNotNull('idade', instance.idade);
  writeNotNull('email', instance.email);
  writeNotNull('estado', instance.estado);
  writeNotNull('cidade', instance.cidade);
  writeNotNull('endereco', instance.endereco);
  writeNotNull('telefone', instance.telefone);
  writeNotNull('nomeUsuario', instance.nomeUsuario);
  writeNotNull('senha', instance.senha);
  writeNotNull(
      'meusAnimais', instance.meusAnimais?.map((e) => e?.toJson())?.toList());
  writeNotNull('animaisFavoritados',
      instance.animaisFavoritados?.map((e) => e?.toJson())?.toList());
  writeNotNull('animaisAdocao',
      instance.animaisAdocao?.map((e) => e?.toJson())?.toList());
  return val;
}
