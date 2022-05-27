class WordModel {
  String? word;
  String? phonetic;
  String? phoneticUrl;
  String? wordOfTheDayDefinition;

  WordModel({
    this.word,
    this.phonetic,
    this.phoneticUrl,
    this.wordOfTheDayDefinition,
  });

  factory WordModel.fromJson(List json) {
    return WordModel(
      word: json[0]['word'],
      phonetic: json[0]['phonetic'],
      phoneticUrl: json[0]['phonetics'][0]['audio'],
      wordOfTheDayDefinition: json[0]['meanings'][0]['definitions'][0]
          ['definition'],
    );
  }
}
