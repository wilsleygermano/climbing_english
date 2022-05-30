import 'package:climbing_english/features/favorite/model/favorite_words_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FavoriteController {
  Stream<List<FavoriteWordsModel>> getFavoriteWords(String docId) async* {
    List<FavoriteWordsModel> favoriteWords = [];
    final words = await FirebaseFirestore.instance
        .collection("Users")
        .doc(docId)
        .collection("favorite_words")
        .get();

    favoriteWords =
        words.docs.map((e) => FavoriteWordsModel.fromJson(e.data())).toList();

    yield favoriteWords;
  }

  Future deleteFavorite(String docId, String docName) async {
    var dataBase = FirebaseFirestore.instance;

    await dataBase
        .collection("Users")
        .doc(docId)
        .collection("favorite_words")
        .doc(docName)
        .delete();
  }

  Future speakWord(String word) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.speak(word);
    await flutterTts.setQueueMode(1);
    await flutterTts.setLanguage("en-US");
  }
}
