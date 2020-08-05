import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meau_app/model/meauapp_context.dart';
import 'package:meau_app/model/pessoa.dart';
import 'package:meau_app/utils/meau_cores.dart';
import 'package:meau_app/utils/meau_util.dart';
import 'package:meau_app/widgets/meau_raised_button_loading_widget.dart';


class CadastroPessoalScreen extends StatefulWidget {


  @override
  _CadastroPessoalScreenState createState() => _CadastroPessoalScreenState();
}

class _CadastroPessoalScreenState extends State<CadastroPessoalScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _senha1 = TextEditingController();
  TextEditingController _senha2 = TextEditingController();
  Pessoa _pessoa = Pessoa();
  ImagePicker imagePicker = ImagePicker();
  ImageProvider imagemUsuario;

  String texto =
      "As informações preenchidas serão divulgadas\napenas para a pessoa com a qual você realizar\n"
      "o processo de adoção e/ou apadrinhamento,\napós a formalização do processo.";

  void _cadastrarUsuario(Pessoa pessoa) async {
    // 1 - cadastrar auth
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: this._pessoa.email, password: this._pessoa.senha)
        .then((authResult) async {
      this._pessoa.id = authResult.user.uid;

      // A senha só deve ficar no auth, pq lá é criptografada.
      this._pessoa.senha = null;
      await Firestore.instance
          .collection("pessoas")
          .document(this._pessoa.id)
          .setData(this._pessoa.toJson());
    }).then((x) async {
      await FirebaseStorage.instance
          .ref()
          .child("pessoas")
          .child(this._pessoa.id)
          .putFile(this._pessoa.foto)
          .onComplete;
    }).then((x) {
      MeauAppContext.instance.usuarioLogado = this._pessoa;
      return Navigator.of(context).pushReplacementNamed("/listaAnimais");
    }).catchError((x) => print(x));
  }

  @override
  Widget build(BuildContext context) {
    return Util.createDefaultMaterialApp(
        context,
        "Cadastro Pessoal",
        ListView(
          children: <Widget>[
            Container(
                width: 340,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Cores.azulClaro,
                            borderRadius: BorderRadius.circular(5)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        child: Text(texto,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 14.0,
                                color: Cores.pretoForte)),
                      ),
                      Util.createFieldLabel("INFORMAÇÕES PESSOAIS",
                          textColor: Cores.azulForte),
                      Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Util.createTextFormField("Nome Completo",
                                    onSaved: (v) =>
                                        this._pessoa.nomeCompleto = v),
                                Util.createTextFormField("Idade",
                                    onSaved: (v) =>
                                        this._pessoa.idade = int.parse(v),
                                    textInputType: TextInputType.number),
                                Util.createTextFormField("E-mail",
                                    onSaved: (v) => this._pessoa.email = v),
                                Util.createTextFormField("Estado",
                                    onSaved: (v) => this._pessoa.estado = v),
                                Util.createTextFormField("Cidade",
                                    onSaved: (v) => this._pessoa.cidade = v),
                                Util.createTextFormField("Endereço",
                                    onSaved: (v) => this._pessoa.endereco = v),
                                Util.createTextFormField("Telefone",
                                    onSaved: (v) => this._pessoa.telefone = v),
                                Util.createTextFormField("Nome de usuário",
                                    onSaved: (v) =>
                                        this._pessoa.nomeUsuario = v),
                                Util.createTextFormField("Senha",
                                    controller: _senha1,
                                    obscureText: true,
                                    validator: (v) {
                                      if (v.isEmpty) {
                                        return "Campo obrigatório";
                                      }
                                      return null;
                                    },
                                    onSaved: (v) => this._pessoa.senha = v),
                                Util.createTextFormField("Confirmação de Senha",
                                    controller: _senha2,
                                    obscureText: true, validator: (v) {
                                  if (v.isEmpty) {
                                    return "Campo obrigatório";
                                  } else if (_senha1.text != v) {
                                    return "Senhas diferentes.";
                                  }

                                  return null;
                                }),
                                Util.createFieldLabel("FOTO DO PERFIL",
                                    textColor: Cores.azulEscuro),
                                Util.createFlatButton(
                                    text: "Adicionar foto",
                                    width: 150,
                                    height: 160,
                                    imagem: this._pessoa.foto == null
                                        ? this._pessoa.foto
                                        : Image.file(this._pessoa.foto)?.image,
                                    onPressed: () async {
                                      File galleryImage =
                                          await ImagePicker.pickImage(
                                              source: ImageSource.gallery,
                                              maxHeight: 80.0,
                                              maxWidth: 80.0);
                                      setState(() {
                                        this._pessoa.foto = galleryImage;
                                      });
                                      // atualizar botão
                                    })
                              ])),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                          child: MeauRaisedButtonLoading("FAZER CADASTRO",
                              () async {
                            if (this._formKey.currentState.validate()) {
                              this._formKey.currentState.save();
                              
                              try {
                                _cadastrarUsuario(this._pessoa);
                              } catch (e) {
                                print(e);
                              }
                            }
                          }),
                        ),
                      )
                    ])),
          ],
        ),
        isBlueTheme: true);
  }
}
