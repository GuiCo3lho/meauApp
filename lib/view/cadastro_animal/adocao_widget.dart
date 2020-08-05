import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meau_app/model/animal.dart';
import 'package:meau_app/model/meauapp_context.dart';
import 'package:meau_app/model/pessoa.dart';
import 'package:meau_app/service/animal_service.dart';
import 'package:meau_app/utils/meau_cores.dart';
import 'package:meau_app/utils/meau_util.dart';
import 'package:meau_app/widgets/meau_raised_button_loading_widget.dart';
import 'package:strings/strings.dart';

class AdocaoWidget extends StatefulWidget {
  @override
  _AdocaoWidgetState createState() => _AdocaoWidgetState();
}

class _AdocaoWidgetState extends State<AdocaoWidget> {
  Animal _animal = Animal();
  final AnimalService _animalService = AnimalService();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _animal.temperamento = List();
    _animal.exigencias = List();
    _animal.acompanhamento = List();
    _animal.saude = List();
    super.initState();
  }

  bool _isPresent(dynamic valor, List lista) {
    if (lista == null || lista.isEmpty) {
      return false;
    }

    String valorProcurado = valor.toString().split('.').last;
    List listaValores = lista.map((v) => v.toString().split('.').last).toList();

    for (var v in listaValores) {
      if (valorProcurado == v) {
        return true;
      }
    }

    return false;
  }

  void _onChanged(bool valorAtual, dynamic valor, List lista) {
    setState(() {
      if (valorAtual) {
        lista.add(valor);
      } else {
        lista.remove(valor);
      }
    });
  }

  String _checkEmptyField(String v) {
    if (v.isEmpty) {
      return "Campo obrigatório!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Form(
          key: this._formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Util.createFieldLabel("Adoção",
                  fontSize: 16.0,
                  textColor: Cores.pretoForte,
                  fontWeight: FontWeight.w500),
              Util.createFieldLabel("NOME DO ANIMAL"),
              Util.createTextFormField("Nome do animal",
                  onSaved: (v) => this._animal.nome = v,
                  validator: _checkEmptyField),
              Util.createFieldLabel("FOTOS DO ANIMAL"),
              Util.createFlatButton(
                  text: "Adicionar foto",
                  width: 320,
                  height: 160,
                  imagem: this._animal.foto == null
                      ? this._animal.foto
                      : Image.file(this._animal.foto)?.image,
                  onPressed: () async {
                    File galleryImage = await ImagePicker.pickImage(
                        source: ImageSource.gallery,
                        maxHeight: 80.0,
                        maxWidth: 80.0);
                    setState(() {
                      this._animal.foto = galleryImage;
                    });
                    // atualizar botão
                  }),
              Util.createFieldLabel("ESPÉCIE", top: 20.0, bottom: 1.0),
              Util.createNRadiosButtonsRow(
                  this._animal.especie.toString().split('.').last,
                  [
                    TipoEspecie.CACHORRO.toString().split('.').last,
                    capitalize(TipoEspecie.CACHORRO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                    TipoEspecie.GATO.toString().split('.').last,
                    capitalize(TipoEspecie.GATO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase())
                  ],
                  (value) => setState(() => this._animal.especie =
                      TipoEspecie.values.firstWhere(
                          (v) => v.toString().split('.').last == value))),
              Util.createFieldLabel("SEXO"),
              Util.createNRadiosButtonsRow(
                  this._animal.sexo.toString().split('.').last,
                  [
                    Sexo.MACHO.toString().split('.').last,
                    capitalize(
                        Sexo.MACHO.toString().split('.').last.toLowerCase()),
                    Sexo.FEMEA.toString().split('.').last,
                    "Fêmea"
                  ],
                  (value) => setState(() => this._animal.sexo = Sexo.values
                      .firstWhere(
                          (v) => v.toString().split('.').last == value))),
              Util.createFieldLabel("IDADE"),
              Util.createNRadiosButtonsRow(
                  this._animal.idade.toString().split('.').last,
                  [
                    Idade.FILHOTE.toString().split('.').last,
                    capitalize(
                        Idade.FILHOTE.toString().split('.').last.toLowerCase()),
                    Idade.ADULTO.toString().split('.').last,
                    capitalize(
                        Idade.ADULTO.toString().split('.').last.toLowerCase()),
                    Idade.IDOSO.toString().split('.').last,
                    capitalize(
                        Idade.IDOSO.toString().split('.').last.toLowerCase()),
                  ],
                  (value) => setState(() => this._animal.idade = Idade.values
                      .firstWhere(
                          (v) => v.toString().split('.').last == value))),
              Util.createFieldLabel("Temperamento"),
              Util.createNCheckBoxRow(
                  this._animal.temperamento,
                  [
                    Temperamento.BRINCALHAO,
                    capitalize(Temperamento.BRINCALHAO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                    Temperamento.TIMIDO,
                    capitalize(Temperamento.TIMIDO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                    Temperamento.CALMO,
                    capitalize(Temperamento.CALMO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                  ],
                  _isPresent,
                  _onChanged),
              Util.createNCheckBoxRow(
                  this._animal.temperamento,
                  [
                    Temperamento.GUARDA,
                    capitalize(Temperamento.GUARDA
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                    Temperamento.AMOROSO,
                    capitalize(Temperamento.AMOROSO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                    Temperamento.PREGUICOSO,
                    capitalize(Temperamento.PREGUICOSO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                  ],
                  _isPresent,
                  _onChanged),
              Util.createFieldLabel("SAÚDE"),
              Util.createNCheckBoxRow(
                  this._animal.saude,
                  [
                    Saude.VACINADO,
                    capitalize(Saude.VACINADO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                    Saude.VERMIFUGADO,
                    capitalize(Saude.VERMIFUGADO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                  ],
                  _isPresent,
                  _onChanged),
              Util.createNCheckBoxRow(
                  this._animal.saude,
                  [
                    Saude.CASTRADO,
                    capitalize(Saude.CASTRADO
                        .toString()
                        .split('.')
                        .last
                        .toLowerCase()),
                    Saude.DOENTE,
                    capitalize(
                        Saude.DOENTE.toString().split('.').last.toLowerCase()),
                  ],
                  _isPresent,
                  _onChanged),
              Util.createFieldLabel("Doenças do Animal",
                  textColor: Cores.cinzaEscuro, fontSize: 14.0),
              Util.createFieldLabel("EXIGÊNCIAS PARA ADOÇÃO"),
              Util.createNCheckBoxColumn(
                  this._animal.exigencias,
                  [
                    Exigencias.TERMO_ADOCAO,
                    "Termo de adoção",
                    Exigencias.FOTOS_CASA,
                    "Fotos da casa",
                    Exigencias.VISITA_PREVIA,
                    "Visita prévia ao animal",
                    Exigencias.ACOMPANHAMENTO_POS,
                    "Acompanhamento pós adoção"
                  ],
                  _isPresent,
                  _onChanged),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Util.createNCheckBoxColumn(
                      this._animal.acompanhamento,
                      [
                        Acompanhamento.MES_1,
                        "1 mês",
                        Acompanhamento.MESES_3,
                        "3 meses",
                        Acompanhamento.MESES_6,
                        "6 meses",
                      ],
                      _isPresent,
                      _isPresent(Exigencias.ACOMPANHAMENTO_POS,
                              this._animal.exigencias)
                          ? _onChanged
                          : null)),
              Util.createFieldLabel("SOBRE O ANIMAL"),
              Util.createTextFormField("Compartilhe a história do animal",
                  onSaved: (v) => this._animal.sobreAnimal = v,
                  validator: _checkEmptyField),
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: MeauRaisedButtonLoading("COLOCAR PARA ADOÇÃO",
                        () async {
                      if (this._formKey.currentState.validate()) {
                        this._formKey.currentState.save();

                        await FirebaseAuth.instance
                            .currentUser()
                            .then((user) async {
                          DocumentSnapshot userSnap = await Firestore.instance
                              .collection("pessoas")
                              .document(user.uid)
                              .get();
                          this._animal.dono = Pessoa.fromJson(userSnap.data);
                          this._animal.donoCadastrado = this._animal.dono;
                        });

                        // 1 - Colocar o dono no animal.
                        this._animal.tipoCadastro = TipoCadastro.ADOCAO;

                        this
                            ._animalService
                            .create(this._animal, atualizarDonoCadastro: true);
                      }
                    })),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
