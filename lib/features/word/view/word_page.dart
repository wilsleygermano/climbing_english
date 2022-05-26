import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/app_colors.dart';

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
            child: Image(
              image: AssetImage("lib/assets/logo.png"),
            ),
          ),
          actions: [Drawer()],
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
                  title: Text(
                    "Book",
                    style: TextStyle(
                      fontFamily: GoogleFonts.cormorant().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  textColor: AppColors.maincolor2,
                  tileColor: AppColors.maincolor3,
                  trailing: IconButton(
                    onPressed: () {},
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
