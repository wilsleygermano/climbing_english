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

  @override
  String toString() {
    return '''
word: ${word},
firstMeaning: ${firstMeaning},
phonetic: ${phonetic},
pronounceURL: ${pronounceURL}
    ''';
  }
}
