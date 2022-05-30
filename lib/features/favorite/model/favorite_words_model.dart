class FavoriteWordsModel {
  String? word;
  String? meaning;

  FavoriteWordsModel({
    this.word,
    this.meaning,
  });

  factory FavoriteWordsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteWordsModel(
      word: json['word'],
      meaning: json['meaning'],
    );
  }
}
