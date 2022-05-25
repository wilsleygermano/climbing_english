import 'package:flutter/material.dart';

import '../../../core/widgets/app_colors.dart';
import '../../../core/widgets/app_fonts.dart';

class WordPage extends StatefulWidget {
  const WordPage({Key? key}) : super(key: key);

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
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
          title: const Hero(
            tag: "climbing-english",
            child: Image(image: AssetImage("lib/assets/logo.png")),
          ),
          actions: [Drawer()],
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.maincolor3,
                  borderRadius: BorderRadius.circular(16)),
              height: 48,
              width: 342,
              child: Text("WORD",
                  textAlign: TextAlign.center,
                  style: AppFonts.textfont32.copyWith(
                      color: AppColors.maincolor2,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        )),
      ),
    );
  }
}
