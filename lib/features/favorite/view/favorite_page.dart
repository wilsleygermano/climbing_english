import 'package:climbing_english/core/widgets/custom_dialog.dart';
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
  var dataBase = FirebaseFirestore.instance;
  late bool isFavorited;
  FlutterTts flutterTts = FlutterTts();

  late var _uId;

  @override
  void initState() {
    isFavorited = true;
    super.initState();
    _uId = FirebaseAuth.instance.currentUser!.uid;
  }

  Stream<List<FavoriteWordsModel>> getFavoriteWords() async* {
    List<FavoriteWordsModel> favoriteWords = [];
    final words = await FirebaseFirestore.instance
        .collection("Users")
        .doc(_uId)
        .collection("favorite_words")
        .get();

    favoriteWords =
        words.docs.map((e) => FavoriteWordsModel.fromJson(e.data())).toList();

    yield favoriteWords;
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
                    stream: getFavoriteWords(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WordPage(
                                          wordTyped:
                                              snapshot.data![index].word!),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 256,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: AppColors.maincolor3,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 23, left: 18),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                await dataBase
                                                    .collection("Users")
                                                    .doc(_uId)
                                                    .collection(
                                                        "favorite_words")
                                                    .doc(snapshot
                                                        .data![index].word!)
                                                    .delete();
                                                    setState(() {
                                                      getFavoriteWords();
                                                    });
                                              },
                                              icon: isFavorited
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color:
                                                          AppColors.maincolor1,
                                                    )
                                                  : Icon(
                                                      Icons.favorite_outline,
                                                      color:
                                                          AppColors.maincolor1,
                                                    ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          left: 18,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              snapshot.data![index].word!
                                                  .toTitleCase2(),
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.cormorant()
                                                        .fontFamily,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.maincolor1,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                await await flutterTts.speak(
                                                    snapshot
                                                        .data![index].word!);
                                                await flutterTts
                                                    .setQueueMode(1);
                                                await flutterTts
                                                    .setLanguage("en-US");
                                              },
                                              icon: Icon(
                                                Icons.volume_up,
                                                color: AppColors.maincolor1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          left: 18,
                                        ),
                                        child: Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                snapshot.data![index].meaning!,
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.cormorant()
                                                          .fontFamily,
                                                  fontSize: 18,
                                                  color: AppColors.maincolor1,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
