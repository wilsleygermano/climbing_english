import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/app_colors.dart';
import '../../../core/widgets/app_fonts.dart';
import '../../../core/widgets/custom_drawer.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({ Key? key }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.maincolor2,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.maincolor3),
        backgroundColor: AppColors.maincolor2,
      ),
      body: SingleChildScrollView(
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
                child: Text("Favorite Words",
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
                                "Word",
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.cormorant().fontFamily,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.maincolor1,
                                ),
                              ),
                            
                            IconButton(
                              onPressed:(){},
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
                              child:Text(
                                  "Meaning",
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.cormorant().fontFamily,
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
              )            
            ],
          ),
        ),
      ),
    );
  }
}