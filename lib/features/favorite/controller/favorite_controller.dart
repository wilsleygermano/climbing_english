import 'package:climbing_english/features/favorite/model/favorite_words_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteController {
  var uId = FirebaseAuth.instance.currentUser!.uid;

  List<FavoriteWordsModel> favoriteWords = [];


  var dataBase = FirebaseFirestore.instance;

  Stream<List<FavoriteWordsModel>> getFavoriteWords() async* {
    final words = await FirebaseFirestore.instance
        .collection("Users")
        .doc(uId)
        .collection("favorite_words")
        .get();

    favoriteWords =
        words.docs.map((e) => FavoriteWordsModel.fromJson(e.data())).toList();

    yield favoriteWords;
  }


 Future favoriteButtonPressed(String word, bool isFavorited) async {
    await dataBase.collection("Users").doc(uId).set({'id': uId});

    final docRef = await dataBase
        .collection("Users")
        .doc(uId)
        .collection("favorite_words")
        .doc(word)
        .get()
        .then((value) => value.exists);

    if (docRef == true) {
      return [
        await dataBase
            .collection("Users")
            .doc(uId)
            .collection("favorite_words")
            .doc(word)
            .delete(),
        isFavorited = false
      ];
    }
  }

}
