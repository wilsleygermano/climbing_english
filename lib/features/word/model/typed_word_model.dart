class TypedWordModel {
  String? word;
  String? phonetic;
  String? phoneticUrl;
  String? wordOfTheDayDefinition;

  TypedWordModel({
    this.word,
    this.phonetic,
    this.phoneticUrl,
    this.wordOfTheDayDefinition,
  });

  factory TypedWordModel.fromJson(List<Map<String, dynamic>> json) {
    return TypedWordModel(
      word: json[0]['word'],
      phonetic: json[0]['phonetic'],
      phoneticUrl: json[0]['phonetics'][0]['audio'],
      wordOfTheDayDefinition: json[0]['meanings'][0]['definitions'][0]
          ['definition'],
    );
  }
}
