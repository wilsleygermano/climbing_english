import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/features/word/view/word_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteCardModel extends StatefulWidget {
  final String favoriteWordChoosedToShown;
  final Function() favoriteButtonPressed;
  final bool isFavorited;
  final String word;
  final Function() speakButtonPressed;
  final String meaning;

  const FavoriteCardModel(
      {Key? key,
      required this.favoriteWordChoosedToShown,
      required this.favoriteButtonPressed,
      required this.isFavorited,
      required this.word,
      required this.speakButtonPressed,
      required this.meaning})
      : super(key: key);

  @override
  State<FavoriteCardModel> createState() => _FavoriteCardModelState();
}

class _FavoriteCardModelState extends State<FavoriteCardModel> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WordPage(
              wordTyped: widget.favoriteWordChoosedToShown,
            ),
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 23, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: widget.favoriteButtonPressed,
                      icon: widget.isFavorited
                          ? Icon(
                              Icons.favorite,
                              color: AppColors.maincolor1,
                            )
                          : Icon(
                              Icons.favorite_outline,
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
                    Text(
                      widget.word,
                      style: TextStyle(
                        fontFamily: GoogleFonts.cormorant().fontFamily,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.maincolor1,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.speakButtonPressed,
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
                        widget.meaning,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontFamily: GoogleFonts.cormorant().fontFamily,
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
  }
}
