import 'package:climbing_english/features/word/controller/word_controller.dart';
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.maincolor2,
          title: Padding(
            padding: const EdgeInsets.only(left: 88.0),
            child: Container(
              height: 56,
              child: const Hero(
                tag: "climbing-english",
                child: Image(
                  image: AssetImage("lib/assets/logo.png"),
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 68.0, left: 36, right: 36),
                child: ListTile(
                  title: Observer(builder: (_) {
                    return Text(
                      _controller.word.toTitleCase(),
                      style: TextStyle(
                        fontFamily: GoogleFonts.cormorant().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
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
            ],
          ),
        ),
      ),
    );
  }
}
