import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meau_app/model/animal.dart';
import 'package:meau_app/service/base_service.dart';

class AnimalService extends BaseService<Animal> {
  

  // 1 - Cadastra o animal.
  // 2 - Salva a imagem do animal.
  // 3 - Se for pra atualizar o dono, adiciona uma referência a esse animal no dono.
  @override
  void create(Animal animal, {atualizarDonoCadastro: false}) async {
    File fotoAnimal = animal.foto;
    DocumentReference animalDocReference;

    // Foto do animal não é salva no firestore, e sim no data storage.
    animal.foto = null;

    print(animal.toJson());
    //animalJson.removeWhere((x, y) => x == "dono" || x == "donoCadastrado");
    //await Firestore.instance.runTransaction((transaction) async {
    await Firestore.instance
        .collection("animais")
        .add(animal.toJson())
        .then((aDocReference) async {
      animalDocReference = aDocReference;
      // atualiza o animal id pra ter uma referência do seu doc.
      await aDocReference.updateData({"id": aDocReference.documentID});
      animal.id = aDocReference.documentID;
    }).then((x) async {
      await FirebaseStorage.instance
          .ref()
          .child("animais")
          .child(animal.id.toString())
          .putFile(fotoAnimal)
          .onComplete;
    }).then((x) async {
      if (atualizarDonoCadastro) {
        // Os animais cadastrados no dono, não precisam desse campo.
        // Seria redudante.

        Map<String, dynamic> animalJson = animal.toJson();
        animalJson.removeWhere((x, y) => x == "dono" || x == "donoCadastrado");

        await Firestore.instance
            .collection("pessoas")
            .document(animal.donoCadastrado.id)
            .updateData({
          "meusAnimais": FieldValue.arrayUnion([animalJson])
        });
      }
    });
    //});
  }

  @override
  void delete(Animal entidade) {
    // TODO: implement delete
  }

  @override
  Animal get(int id) {
    // TODO: implement get
    return null;
  }

  @override
  void update(Animal entidade) {
    // TODO: implement update
  }
}
