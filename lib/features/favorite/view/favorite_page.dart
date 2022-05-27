import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}