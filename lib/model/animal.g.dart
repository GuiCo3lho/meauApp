// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['nome']);
  return Animal(
    id: json['id'] as String,
    donoCadastrado: json['donoCadastrado'] == null
        ? null
        : Pessoa.fromJson(json['donoCadastrado'] as Map<String, dynamic>),
    dono: json['dono'] == null
        ? null
        : Pessoa.fromJson(json['dono'] as Map<String, dynamic>),
    tipoCadastro:
        _$enumDecodeNullable(_$TipoCadastroEnumMap, json['tipoCadastro']),
    nome: json['nome'] as String,
    especie: _$enumDecodeNullable(_$TipoEspecieEnumMap, json['especie']),
    sexo: _$enumDecodeNullable(_$SexoEnumMap, json['sexo']),
    porte: _$enumDecodeNullable(_$PorteEnumMap, json['porte']),
    idade: _$enumDecodeNullable(_$IdadeEnumMap, json['idade']),
    temperamento: (json['temperamento'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TemperamentoEnumMap, e))
        ?.toList(),
    saude: (json['saude'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SaudeEnumMap, e))
        ?.toList(),
    doencas: json['doencas'] as String,
    exigencias: (json['exigencias'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ExigenciasEnumMap, e))
        ?.toList(),
    acompanhamento: (json['acompanhamento'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AcompanhamentoEnumMap, e))
        ?.toList(),
    sobreAnimal: json['sobreAnimal'] as String,
  );
}

Map<String, dynamic> _$AnimalToJson(Animal instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('donoCadastrado', instance.donoCadastrado?.toJson());
  writeNotNull('dono', instance.dono?.toJson());
  writeNotNull('tipoCadastro', _$TipoCadastroEnumMap[instance.tipoCadastro]);
  writeNotNull('nome', instance.nome);
  writeNotNull('especie', _$TipoEspecieEnumMap[instance.especie]);
  writeNotNull('sexo', _$SexoEnumMap[instance.sexo]);
  writeNotNull('porte', _$PorteEnumMap[instance.porte]);
  writeNotNull('idade', _$IdadeEnumMap[instance.idade]);
  writeNotNull('temperamento',
      instance.temperamento?.map((e) => _$TemperamentoEnumMap[e])?.toList());
  writeNotNull(
      'saude', instance.saude?.map((e) => _$SaudeEnumMap[e])?.toList());
  writeNotNull('doencas', instance.doencas);
  writeNotNull('exigencias',
      instance.exigencias?.map((e) => _$ExigenciasEnumMap[e])?.toList());
  writeNotNull(
      'acompanhamento',
      instance.acompanhamento
          ?.map((e) => _$AcompanhamentoEnumMap[e])
          ?.toList());
  writeNotNull('sobreAnimal', instance.sobreAnimal);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$TipoCadastroEnumMap = {
  TipoCadastro.ADOCAO: 'ADOCAO',
  TipoCadastro.APADRINHAR: 'APADRINHAR',
  TipoCadastro.AJUDA: 'AJUDA',
};

const _$TipoEspecieEnumMap = {
  TipoEspecie.CACHORRO: 'CACHORRO',
  TipoEspecie.GATO: 'GATO',
};

const _$SexoEnumMap = {
  Sexo.MACHO: 'MACHO',
  Sexo.FEMEA: 'FEMEA',
};

const _$PorteEnumMap = {
  Porte.PEQUENO: 'PEQUENO',
  Porte.MEDIO: 'MEDIO',
  Porte.GRANDE: 'GRANDE',
};

const _$IdadeEnumMap = {
  Idade.FILHOTE: 'FILHOTE',
  Idade.ADULTO: 'ADULTO',
  Idade.IDOSO: 'IDOSO',
};

const _$TemperamentoEnumMap = {
  Temperamento.BRINCALHAO: 'BRINCALHAO',
  Temperamento.TIMIDO: 'TIMIDO',
  Temperamento.CALMO: 'CALMO',
  Temperamento.GUARDA: 'GUARDA',
  Temperamento.AMOROSO: 'AMOROSO',
  Temperamento.PREGUICOSO: 'PREGUICOSO',
};

const _$SaudeEnumMap = {
  Saude.VACINADO: 'VACINADO',
  Saude.VERMIFUGADO: 'VERMIFUGADO',
  Saude.CASTRADO: 'CASTRADO',
  Saude.DOENTE: 'DOENTE',
};

const _$ExigenciasEnumMap = {
  Exigencias.TERMO_ADOCAO: 'TERMO_ADOCAO',
  Exigencias.FOTOS_CASA: 'FOTOS_CASA',
  Exigencias.VISITA_PREVIA: 'VISITA_PREVIA',
  Exigencias.ACOMPANHAMENTO_POS: 'ACOMPANHAMENTO_POS',
};

const _$AcompanhamentoEnumMap = {
  Acompanhamento.MES_1: 'MES_1',
  Acompanhamento.MESES_3: 'MESES_3',
  Acompanhamento.MESES_6: 'MESES_6',
};
