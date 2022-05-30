import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/app_fonts.dart';
import 'package:climbing_english/features/favorite/model/favorite_words_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'rank_controller.g.dart';

class RankController = _RankControllerBase with _$RankController;

abstract class _RankControllerBase with Store {
  @observable
  double percent = 0;

  @observable
  int totalWords = 0;

  @action
  Future countUserFavoriteWords() async {
    List<FavoriteWordsModel> userFavoriteWords = [];
    var uId = FirebaseAuth.instance.currentUser!.uid;
    final words = await FirebaseFirestore.instance
        .collection("Users")
        .doc(uId)
        .collection("favorite_words")
        .get();
    userFavoriteWords =
        words.docs.map((e) => FavoriteWordsModel.fromJson(e.data())).toList();
    totalWords = userFavoriteWords.length;
    if (userFavoriteWords.length <= 10) {
      return percent = .15;
    }
    if (userFavoriteWords.length > 10 && userFavoriteWords.length <= 30) {
      return percent = .25;
    }
    if (userFavoriteWords.length > 30 && userFavoriteWords.length <= 50) {
      return percent = .50;
    }
    if (userFavoriteWords.length > 50 && userFavoriteWords.length <= 60) {
      return percent = .70;
    }
    if (userFavoriteWords.length > 60 && userFavoriteWords.length <= 70) {
      return percent = .85;
    }
    if (userFavoriteWords.length > 50) {
      return percent = .95;
    }
    if (userFavoriteWords.length > 100) {
      return percent = 1;
    }
  }

  @action
  Future showUserTotalFavoriteWordsDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Progress",
          style: AppFonts.appfont16.copyWith(
            color: AppColors.maincolor3,
          ),
        ),
        content: Text(
          "You've already favorited $totalWords words. Keep going!",
          style: AppFonts.appfont16.copyWith(
            color: AppColors.maincolor3,
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: AppFonts.appfont16.copyWith(
                color: AppColors.maincolor3,
              ),
            ),
          )
        ],
      ),
    );
  }

  @action
  void setPercentValue(double newValue) => percent = newValue;

  @action
  currentProgressColor1() {
    if (percent <= 0.25) {
      return AppColors.maincolor3;
    }
  }

  @action
  currentProgressColor2() {
    if (percent <= 0.26 && percent >= 0.5) {
      return percent;
    }
  }

  @action
  currentProgressColor3() {
    if (percent <= 0.51 && percent >= 0.75) {
      return percent;
    }
  }

  @action
  currentProgressColor4() {
    if (percent <= 0.76 && percent >= 0.90) {
      return percent;
    }
  }

  @action
  currentProgressColor5() {
    if (percent <= 0.91 && percent >= 0.95) {
      return percent;
    }
  }

  @action
  currentProgressColor6() {
    if (percent == 1.0) {
      return percent;
    }
  }
}
