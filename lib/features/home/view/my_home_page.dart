import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/custom_drawer.dart';
import 'package:climbing_english/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = HomeController();

  @override
  void initState() {
    _controller.getWordOfTheDay();
    _controller.checkIfAWordIsFavorited();
    super.initState();
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
      body: Center(
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
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                left: 18,
                right: 18,
              ),
              child: TextField(
                onChanged: _controller.storeWordTyped,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.maincolor1,
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: AppColors.maincolor1,
                    fontFamily: GoogleFonts.lato().fontFamily,
                    fontSize: 20,
                  ),
                  hintText: "Type a Word",
                  suffixIcon: IconButton(
                    onPressed: () async {
                      await _controller.searchWordTyped(context);
                    },
                    icon: Icon(
                      Icons.search,
                      color: AppColors.maincolor1,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.transparent,
                  ),
                  focusColor: AppColors.maincolor1,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.maincolor3,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: AppColors.maincolor3,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 76,
                left: 18,
                right: 18,
              ),
              child: SingleChildScrollView(
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
                        padding: const EdgeInsets.only(top: 23, left: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Word of the day:",
                              style: TextStyle(
                                fontFamily: GoogleFonts.lato().fontFamily,
                                fontSize: 18,
                                color: AppColors.maincolor1,
                              ),
                            ),
                            Observer(builder: (_) {
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
                            Observer(builder: (_) {
                              return Text(
                                _controller.word.toTitleCase(),
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.cormorant().fontFamily,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.maincolor1,
                                ),
                              );
                            }),
                            IconButton(
                              onPressed: _controller.speakWord,
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
                              child: Observer(builder: (_) {
                                return Text(
                                  _controller.firstMeaning,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
                                    fontSize: 18,
                                    color: AppColors.maincolor1,
                                    fontStyle: FontStyle.italic,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
