// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RankController on _RankControllerBase, Store {
  late final _$percentAtom =
      Atom(name: '_RankControllerBase.percent', context: context);

  @override
  double get percent {
    _$percentAtom.reportRead();
    return super.percent;
  }

  @override
  set percent(double value) {
    _$percentAtom.reportWrite(value, super.percent, () {
      super.percent = value;
    });
  }

  late final _$totalWordsAtom =
      Atom(name: '_RankControllerBase.totalWords', context: context);

  @override
  int get totalWords {
    _$totalWordsAtom.reportRead();
    return super.totalWords;
  }

  @override
  set totalWords(int value) {
    _$totalWordsAtom.reportWrite(value, super.totalWords, () {
      super.totalWords = value;
    });
  }

  late final _$countUserFavoriteWordsAsyncAction = AsyncAction(
      '_RankControllerBase.countUserFavoriteWords',
      context: context);

  @override
  Future<dynamic> countUserFavoriteWords() {
    return _$countUserFavoriteWordsAsyncAction
        .run(() => super.countUserFavoriteWords());
  }

  late final _$showUserTotalFavoriteWordsDialogAsyncAction = AsyncAction(
      '_RankControllerBase.showUserTotalFavoriteWordsDialog',
      context: context);

  @override
  Future<dynamic> showUserTotalFavoriteWordsDialog(BuildContext context) {
    return _$showUserTotalFavoriteWordsDialogAsyncAction
        .run(() => super.showUserTotalFavoriteWordsDialog(context));
  }

  late final _$_RankControllerBaseActionController =
      ActionController(name: '_RankControllerBase', context: context);

  @override
  void setPercentValue(double newValue) {
    final _$actionInfo = _$_RankControllerBaseActionController.startAction(
        name: '_RankControllerBase.setPercentValue');
    try {
      return super.setPercentValue(newValue);
    } finally {
      _$_RankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentProgressColor1() {
    final _$actionInfo = _$_RankControllerBaseActionController.startAction(
        name: '_RankControllerBase.currentProgressColor1');
    try {
      return super.currentProgressColor1();
    } finally {
      _$_RankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentProgressColor2() {
    final _$actionInfo = _$_RankControllerBaseActionController.startAction(
        name: '_RankControllerBase.currentProgressColor2');
    try {
      return super.currentProgressColor2();
    } finally {
      _$_RankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentProgressColor3() {
    final _$actionInfo = _$_RankControllerBaseActionController.startAction(
        name: '_RankControllerBase.currentProgressColor3');
    try {
      return super.currentProgressColor3();
    } finally {
      _$_RankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentProgressColor4() {
    final _$actionInfo = _$_RankControllerBaseActionController.startAction(
        name: '_RankControllerBase.currentProgressColor4');
    try {
      return super.currentProgressColor4();
    } finally {
      _$_RankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentProgressColor5() {
    final _$actionInfo = _$_RankControllerBaseActionController.startAction(
        name: '_RankControllerBase.currentProgressColor5');
    try {
      return super.currentProgressColor5();
    } finally {
      _$_RankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic currentProgressColor6() {
    final _$actionInfo = _$_RankControllerBaseActionController.startAction(
        name: '_RankControllerBase.currentProgressColor6');
    try {
      return super.currentProgressColor6();
    } finally {
      _$_RankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
percent: ${percent},
totalWords: ${totalWords}
    ''';
  }
}
