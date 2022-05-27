// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$wordAtom =
      Atom(name: '_HomeControllerBase.word', context: context);

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

  late final _$firstMeaningAtom =
      Atom(name: '_HomeControllerBase.firstMeaning', context: context);

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

  late final _$phoneticAtom =
      Atom(name: '_HomeControllerBase.phonetic', context: context);

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
      Atom(name: '_HomeControllerBase.pronounceURL', context: context);

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

  late final _$wordTypedAtom =
      Atom(name: '_HomeControllerBase.wordTyped', context: context);

  @override
  String get wordTyped {
    _$wordTypedAtom.reportRead();
    return super.wordTyped;
  }

  @override
  set wordTyped(String value) {
    _$wordTypedAtom.reportWrite(value, super.wordTyped, () {
      super.wordTyped = value;
    });
  }

  late final _$isFavoritedAtom =
      Atom(name: '_HomeControllerBase.isFavorited', context: context);

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

  late final _$getWordOfTheDayAsyncAction =
      AsyncAction('_HomeControllerBase.getWordOfTheDay', context: context);

  @override
  Future<void> getWordOfTheDay() {
    return _$getWordOfTheDayAsyncAction.run(() => super.getWordOfTheDay());
  }

  late final _$speakWordAsyncAction =
      AsyncAction('_HomeControllerBase.speakWord', context: context);

  @override
  Future<dynamic> speakWord() {
    return _$speakWordAsyncAction.run(() => super.speakWord());
  }

  late final _$searchWordTypedAsyncAction =
      AsyncAction('_HomeControllerBase.searchWordTyped', context: context);

  @override
  Future<dynamic> searchWordTyped(BuildContext context) {
    return _$searchWordTypedAsyncAction
        .run(() => super.searchWordTyped(context));
  }

  late final _$checkIfAWordIsFavoritedAsyncAction = AsyncAction(
      '_HomeControllerBase.checkIfAWordIsFavorited',
      context: context);

  @override
  Future<dynamic> checkIfAWordIsFavorited() {
    return _$checkIfAWordIsFavoritedAsyncAction
        .run(() => super.checkIfAWordIsFavorited());
  }

  late final _$favoriteButtonPressedAsyncAction = AsyncAction(
      '_HomeControllerBase.favoriteButtonPressed',
      context: context);

  @override
  Future<dynamic> favoriteButtonPressed() {
    return _$favoriteButtonPressedAsyncAction
        .run(() => super.favoriteButtonPressed());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void storeWordTyped(String newValue) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.storeWordTyped');
    try {
      return super.storeWordTyped(newValue);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
word: ${word},
firstMeaning: ${firstMeaning},
phonetic: ${phonetic},
pronounceURL: ${pronounceURL},
wordTyped: ${wordTyped},
isFavorited: ${isFavorited}
    ''';
  }
}
