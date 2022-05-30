import 'package:climbing_english/features/word/controller/word_controller.dart';
import 'package:climbing_english/features/word/model/searched_word_model.dart';
import 'package:climbing_english/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/app_colors.dart';

class WordPage extends StatefulWidget {
  final String wordTyped;
  const WordPage({Key? key, required this.wordTyped}) : super(key: key);

  @override
  State<WordPage> createState() => _WordPageState();
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class _WordPageState extends State<WordPage> {
  final _controller = WordController();

  @override
  void initState() {
    _controller.getWordTyped(widget.wordTyped);
    _controller.checkIfAWordIsFavorited(widget.wordTyped);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("lib/assets/fundo.app.jpeg"),
        ),
      ),
      child: Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.maincolor3),
          backgroundColor: AppColors.maincolor2,
          title: Padding(
            padding: const EdgeInsets.only(left: 88),
            child: Container(
              height: 56,
              child: const Hero(
                tag: "climbing-english",
                child: Image(image: AssetImage("lib/assets/logo.png")),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 68.0, left: 36, right: 36),
                  child: ListTile(
                    leading: Observer(builder: (_) {
                      return IconButton(
                        onPressed: () async {
                          await _controller.favoriteButtonPressed();
                        },
                        icon: _controller.isFavorited
                            ? Icon(
                                Icons.favorite,
                                color: AppColors.maincolor1,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                color: AppColors.maincolor1,
                              ),
                      );
                    }),
                    title: Observer(builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          _controller.word.toTitleCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: GoogleFonts.cormorant().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      );
                    }),
                    textColor: AppColors.maincolor2,
                    tileColor: AppColors.maincolor3,
                    trailing: IconButton(
                      onPressed: _controller.speakWord,
                      icon: Icon(
                        Icons.volume_up,
                        color: AppColors.maincolor2,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32, left: 22, right: 22),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.68,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Observer(builder: (_) {
                      final definitions = _controller.definitions;
                      return ListView.builder(
                        itemCount: definitions.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "- ${definitions[index].definition!}\n",
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          );
                        },
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
