import 'package:climbing_english/core/model/word_model.dart';
import 'package:climbing_english/features/word/model/searched_word_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/classes/dictionary_api_url.dart';
part 'word_controller.g.dart';

class WordController = _WordControllerBase with _$WordController;

abstract class _WordControllerBase with Store {
  FlutterTts flutterTts = FlutterTts();

  var uId = FirebaseAuth.instance.currentUser!.uid;

  var dataBase = FirebaseFirestore.instance;

  @observable
  String firstMeaning = "Carregando...";

  @observable
  String word = "Carregando...";

  @observable
  String phonetic = "Carregando...";

  @observable
  String pronounceURL = "";

  @observable
  List<Definition> definitions = [];

  @action
  Future<void> getWordTyped(String wordTyped) async {
    WordModel wordModel;
    List<Definition> apiDefinitions;
    try {
      final dio = Dio();
      final apiURL = DictionaryApiUrl.url + wordTyped;
      var response = await dio.get(apiURL);
      // Retorna uma lista de mapas.
      final json = List<Map<String, dynamic>>.from(response.data);
      wordModel = WordModel.fromJson(json);
      apiDefinitions = List<Definition>.from(json[0]["meanings"][0]
              ["definitions"]
          .map((map) => Definition.fromJson(map as Map<String, dynamic>)));
      word = wordModel.word!;
      firstMeaning = wordModel.wordOfTheDayDefinition!;
      phonetic = wordModel.phonetic!;
      pronounceURL = wordModel.phoneticUrl!;
      definitions = apiDefinitions;
    } on DioError catch (e) {
      word = "Houve um erro: ${e.error}";
      phonetic = "Houve um erro: ${e.error}";
      pronounceURL = "Houve um erro: ${e.error}";
    }
  }

  Future speakWord() async {
    await flutterTts.speak(word);
    // await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setQueueMode(1);
    await flutterTts.setLanguage("en-US");
  }

  @observable
  bool isFavorited = false;

  @action
  Future checkIfAWordIsFavorited(String wordCheck) async {
    final docRef = await dataBase
        .collection("Users")
        .doc(uId)
        .collection("favorite_words")
        .doc(wordCheck)
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
