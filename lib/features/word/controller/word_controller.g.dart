// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WordController on _WordControllerBase, Store {
  late final _$firstMeaningAtom =
      Atom(name: '_WordControllerBase.firstMeaning', context: context);

  @override
  String get firstMeaning {
    _$firstMeaningAtom.reportRead();
    return super.firstMeaning;
  }

  @override
  set firstMeaning(String value) {
    _$firstMeaningAtom.reportWrite(value, super.firstMeaning, () {
      super.firstMeaning = value;
    });
  }

  late final _$wordAtom =
      Atom(name: '_WordControllerBase.word', context: context);

  @override
  String get word {
    _$wordAtom.reportRead();
    return super.word;
  }

  @override
  set word(String value) {
    _$wordAtom.reportWrite(value, super.word, () {
      super.word = value;
    });
  }

  late final _$phoneticAtom =
      Atom(name: '_WordControllerBase.phonetic', context: context);

  @override
  String get phonetic {
    _$phoneticAtom.reportRead();
    return super.phonetic;
  }

  @override
  set phonetic(String value) {
    _$phoneticAtom.reportWrite(value, super.phonetic, () {
      super.phonetic = value;
    });
  }

  late final _$pronounceURLAtom =
      Atom(name: '_WordControllerBase.pronounceURL', context: context);

  @override
  String get pronounceURL {
    _$pronounceURLAtom.reportRead();
    return super.pronounceURL;
  }

  @override
  set pronounceURL(String value) {
    _$pronounceURLAtom.reportWrite(value, super.pronounceURL, () {
      super.pronounceURL = value;
    });
  }

  late final _$definitionsAtom =
      Atom(name: '_WordControllerBase.definitions', context: context);

  @override
  List<Definition> get definitions {
    _$definitionsAtom.reportRead();
    return super.definitions;
  }

  @override
  set definitions(List<Definition> value) {
    _$definitionsAtom.reportWrite(value, super.definitions, () {
      super.definitions = value;
    });
  }

  late final _$isFavoritedAtom =
      Atom(name: '_WordControllerBase.isFavorited', context: context);

  @override
  bool get isFavorited {
    _$isFavoritedAtom.reportRead();
    return super.isFavorited;
  }

  @override
  set isFavorited(bool value) {
    _$isFavoritedAtom.reportWrite(value, super.isFavorited, () {
      super.isFavorited = value;
    });
  }

  late final _$getWordTypedAsyncAction =
      AsyncAction('_WordControllerBase.getWordTyped', context: context);

  @override
  Future<void> getWordTyped(String wordTyped) {
    return _$getWordTypedAsyncAction.run(() => super.getWordTyped(wordTyped));
  }

  late final _$checkIfAWordIsFavoritedAsyncAction = AsyncAction(
      '_WordControllerBase.checkIfAWordIsFavorited',
      context: context);

  @override
  Future<dynamic> checkIfAWordIsFavorited(String wordCheck) {
    return _$checkIfAWordIsFavoritedAsyncAction
        .run(() => super.checkIfAWordIsFavorited(wordCheck));
  }

  late final _$favoriteButtonPressedAsyncAction = AsyncAction(
      '_WordControllerBase.favoriteButtonPressed',
      context: context);

  @override
  Future<dynamic> favoriteButtonPressed() {
    return _$favoriteButtonPressedAsyncAction
        .run(() => super.favoriteButtonPressed());
  }

  @override
  String toString() {
    return '''
firstMeaning: ${firstMeaning},
word: ${word},
phonetic: ${phonetic},
pronounceURL: ${pronounceURL},
definitions: ${definitions},
isFavorited: ${isFavorited}
    ''';
  }
}
