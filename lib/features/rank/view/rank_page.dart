import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/app_fonts.dart';
import 'package:climbing_english/core/widgets/custom_drawer.dart';
import 'package:climbing_english/features/rank/controller/rank_controller.dart';
import 'package:climbing_english/features/rank/model/buttom_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RankPage extends StatefulWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> with TickerProviderStateMixin {
  late AnimationController controller;
  final _controller = RankController();

  @override
  void initState() {
    _controller.countUserFavoriteWords();
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
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                child: Text("Climber Ranking",
                    textAlign: TextAlign.center,
                    style: AppFonts.textfont32.copyWith(
                        color: AppColors.maincolor2,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("We Need to See you Growing Up.",
                  textAlign: TextAlign.center,
                  style: AppFonts.textfont18.copyWith(
                      color: AppColors.textcolor,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Text("FAVORITE your words and accumulate knowledge.",
                  textAlign: TextAlign.center,
                  style: AppFonts.textfont18.copyWith(
                      color: AppColors.textcolor,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Text("Follow the rules and CLIMB your ENGLISH!!",
                  textAlign: TextAlign.center,
                  style: AppFonts.textfont18.copyWith(
                      color: AppColors.textcolor,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ButtomModel(onPressed: () async {
                        await _controller.showUserTotalFavoriteWordsDialog(context);
                      }, text: "+100 Words"),
                      const SizedBox(height: 140),
                      ButtomModel(onPressed: () async {
                        await _controller.showUserTotalFavoriteWordsDialog(context);
                      }, text: "40+ Words"),
                      const SizedBox(height: 110),
                      ButtomModel(onPressed: () async {
                        await _controller.showUserTotalFavoriteWordsDialog(context);
                      }, text: "20+ Words"),
                      const SizedBox(height: 90)
                    ],
                  ),
                  Column(
                    children: [
                      Observer(builder: (_) {
                        return RotatedBox(
                          quarterTurns: -1,
                          child: Container(
                            width: 420,
                            height: 9,
                            child: LinearProgressIndicator(
                              color: AppColors.maincolor1,
                              backgroundColor: Colors.black.withOpacity(.25),
                              value: _controller.percent,
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 80),
                      ButtomModel(onPressed: () async {
                        
                      }, text: "50+ Words"),
                      const SizedBox(height: 120),
                      ButtomModel(onPressed: () async {
                        
                      }, text: "30+ Words"),
                      const SizedBox(height: 150),
                      ButtomModel(onPressed: () async {
                        
                      }, text: "10 Words"),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
