import 'package:climbing_english/core/classes/dictionary_api_url.dart';
import 'package:climbing_english/core/model/word_model.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  FlutterTts flutterTts = FlutterTts();

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
      // final decodedJson = jsonDecode(json) as Map<String, dynamic>;
      wordModel = WordModel.fromJson(json);
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
 await flutterTts.awaitSpeakCompletion(true);
 await flutterTts.setLanguage("en-US");
}

}
