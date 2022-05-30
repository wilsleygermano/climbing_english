import 'package:climbing_english/core/widgets/custom_dialog.dart';
import 'package:climbing_english/features/favorite/controller/favorite_controller.dart';
import 'package:climbing_english/features/favorite/model/favorite_words_model.dart';
import 'package:climbing_english/features/home/view/my_home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/app_colors.dart';
import '../../../core/widgets/app_fonts.dart';
import '../../../core/widgets/custom_drawer.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../word/view/word_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

extension StringCasingExtension on String {
  String toCapitalized2() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase2() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized2())
      .join(' ');
}

class _FavoritePageState extends State<FavoritePage> {
  final _controller = FavoriteController();

  late bool isFavorited;
  FlutterTts flutterTts = FlutterTts();

  late var _uId;

  @override
  void initState() {
    isFavorited = true;
    super.initState();
    _uId = FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.maincolor2,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.maincolor3),
        backgroundColor: AppColors.maincolor2,
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Container(
                    width: 272,
                    height: 220,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/assets/logo.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.maincolor3,
                      borderRadius: BorderRadius.circular(16)),
                  height: 48,
                  width: 342,
                  child: Text("My Words",
                      textAlign: TextAlign.center,
                      style: AppFonts.textfont32.copyWith(
                          color: AppColors.maincolor2,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 76,
                    left: 18,
                    right: 18,
                  ),
                  child: StreamBuilder<List<FavoriteWordsModel>>(
                    stream: _controller.getFavoriteWords(_uId),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: 
                            );
                          },
                        );
                      }
                      if (snapshot.hasError) {
                        return CustomDialog(
                          context,
                          "Error",
                          "Cannot display your favorite words",
                          "OK",
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyHomePage(),
                            ),
                          ),
                        );
                      }
                      if (!snapshot.hasData) {
                        return Text("You do not have favorite words yet");
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.purple,
                          strokeWidth: 8.0,
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
