import 'package:climbing_english/core/model/word_model.dart';
import 'package:climbing_english/features/word/model/searched_word_model.dart';
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
      var response = await dio.get<List<Map<String, dynamic>>>(apiURL);
      // Retorna uma lista de mapas. 
      final json = response.data;
      // final decodedJson = jsonDecode(json) as Map<String, dynamic>;
      wordModel = WordModel.fromJson(json!);
      apiDefinitions = json[0]["meanings"][0]["definitions"].map((map) => Definition.fromJson(map)).toList();

      word = wordModel.word!;
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


}
