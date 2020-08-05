// Essa classe é um singleton pra diminuir o acesso ao banco de dados.

import 'package:meau_app/model/pessoa.dart';

class MeauAppContext {
  static final MeauAppContext _instance = MeauAppContext._constructor();
  Pessoa usuarioLogado;

  MeauAppContext._constructor();

  factory MeauAppContext() => _instance;

  static MeauAppContext get instance {
    return _instance;
  }
}
