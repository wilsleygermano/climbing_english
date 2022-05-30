import 'package:climbing_english/core/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/app_colors.dart';
import '../../../core/widgets/app_fonts.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("lib/assets/fundo.info.gif"),
                opacity: 60)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: CustomDrawer(),
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
          body: Center(
              child: Column(
            children: [
              SizedBox(height: 120),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(

                    color: AppColors.maincolor2.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16)),
                height: 380,
                width: 300,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text("Climbing English",
                        textAlign: TextAlign.center,
                        style: AppFonts.textinfo
                            .copyWith(color: AppColors.maincolor3)),
                    SizedBox(height: 25),
                    Text(
                      "Is a project made by",
                      textAlign: TextAlign.center,
                      style: AppFonts.textfont26.copyWith(
                        color: AppColors.textcolor,
                      ),
                    ),
                    Text(
                      "Wilsley Germano and",
                      textAlign: TextAlign.center,
                      style: AppFonts.textfont26.copyWith(
                        color: AppColors.textcolor,
                      ),
                    ),
                    Text(
                      "Gabriel Jungles,",
                      textAlign: TextAlign.center,
                      style: AppFonts.textfont26.copyWith(
                        color: AppColors.textcolor,
                      ),
                    ),
                    Text(
                      "Developers of",
                      textAlign: TextAlign.center,
                      style: AppFonts.textfont26.copyWith(
                        color: AppColors.textcolor,
                      ),
                    ),
                    Text(
                      "SnowMan Labs Academy.",
                      textAlign: TextAlign.center,
                      style: AppFonts.textfont26.copyWith(
                        color: AppColors.textcolor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      child:
                          Image(image: AssetImage("lib/assets/logo.snow.png")),
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
