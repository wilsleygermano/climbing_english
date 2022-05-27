import 'package:climbing_english/core/classes/dictionary_api_url.dart';
import 'package:climbing_english/core/model/word_model.dart';
import 'package:climbing_english/features/word/view/word_page.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  FlutterTts flutterTts = FlutterTts();

  var uId = FirebaseAuth.instance.currentUser!.uid;

  var dataBase = FirebaseFirestore.instance;

  @observable
  String word = "Carregando...";

  @observable
  String firstMeaning = "Carregando...";

  @observable
  String phonetic = "Carregando...";

  @observable
  String pronounceURL = "";

  @action
  Future<void> getWordOfTheDay() async {
    const int _max = 2500;
    int _randomNumber = Random().nextInt(_max) + 1;
    WordModel wordModel;
    var randomWord = nouns.elementAt(_randomNumber);
    try {
      final dio = Dio();
      final apiURL = DictionaryApiUrl.url + randomWord;
      var response = await dio.get(apiURL);
      final json = response.data;
      wordModel = WordModel.fromJson(json!);
      word = wordModel.word!;
      firstMeaning = wordModel.wordOfTheDayDefinition!;
      phonetic = wordModel.phonetic!;
      pronounceURL = wordModel.phoneticUrl!;
    } on DioError catch (e) {
      word = "Houve um erro: ${e.error}";
      firstMeaning = "Houve um erro: ${e.error}";
      phonetic = "Houve um erro: ${e.error}";
      pronounceURL = "Houve um erro: ${e.error}";
    }
  }

  @action
  Future speakWord() async {
    await flutterTts.speak(word);
    await flutterTts.setQueueMode(1);
    await flutterTts.setLanguage("en-US");
  }

  @observable
  String wordTyped = "";

  @computed 
  bool get isTypedWordValid => wordTyped.isNotEmpty && !wordTyped.contains(" ");

  @action
  void storeWordTyped(String newValue) {
    wordTyped = newValue;
  }

  @action
  Future searchWordTyped(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WordPage(wordTyped: wordTyped),
      ),
    );
  }

@action
Future wordOfTheDayTapped(BuildContext context) async {
  await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WordPage(wordTyped: word),
      ),
    );
}


  @observable
  bool isFavorited = false;

  @action
  Future checkIfAWordIsFavorited() async {
      final docRef = await dataBase
        .collection("Users")
        .doc(uId)
        .collection("favorite_words")
        .doc(word)
        .get()
        .then((value) => value.exists);

        if (docRef == true) {
          return isFavorited = true;
        }
        return isFavorited = false;
  }

  @action
  Future favoriteButtonPressed() async {
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
    return [
      await dataBase
          .collection("Users")
          .doc(uId)
          .collection("favorite_words")
          .doc(word)
          .set({
        'word': word,
        'meaning': firstMeaning,
      }),
      isFavorited = true
    ];
  }
}
