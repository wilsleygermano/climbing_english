import 'package:climbing_english/core/model/word_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mobx/mobx.dart';

import '../../../core/classes/dictionary_api_url.dart';
part 'word_controller.g.dart';

class WordController = _WordControllerBase with _$WordController;

abstract class _WordControllerBase with Store {
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
  Future<void> getWordTyped(String wordTyped) async {
    WordModel wordModel;
    try {
      final dio = Dio();
      final apiURL = DictionaryApiUrl.url + wordTyped;
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

  Future speakWord() async {
    await flutterTts.speak(word);
    // await flutterTts.awaitSpeakCompletion(true);
     await flutterTts.setQueueMode(1);
    await flutterTts.setLanguage("en-US");
  }


}
