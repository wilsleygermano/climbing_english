import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:climbing_english/core/widgets/app_fonts.dart';
import 'package:climbing_english/features/rank/controller/rank_controller.dart';
import 'package:climbing_english/features/rank/model/buttom_model.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RankPage extends StatefulWidget {
  const RankPage({Key? key}) : super(key: key);

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  final _controller = RankController;

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
          toolbarHeight: 96,
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
                      color: AppColors.textcolor, fontStyle: FontStyle.italic)),
              Text("FAVORITE your words and accumulate knowledge.",
                  textAlign: TextAlign.center,
                  style: AppFonts.textfont18.copyWith(
                      color: AppColors.textcolor, fontStyle: FontStyle.italic)),
              Text("Follow the rules and CLIMB your ENGLISH!!",
                  textAlign: TextAlign.center,
                  style: AppFonts.textfont18.copyWith(
                      color: AppColors.textcolor, fontStyle: FontStyle.italic)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ButtomModel(onPressed: () {}, text: "+1500 Words"),
                      const SizedBox(height: 140),
                      ButtomModel(onPressed: () {}, text: "600 Words"),
                      const SizedBox(height: 110),
                      ButtomModel(onPressed: () {}, text: "200 Words"),
                      SizedBox(height: 90)
                    ],
                  ),
                  Column(
                    children: [
                      LinearPercentIndicator(
                        animateFromLastPercent: true,
                        progressColor: AppColors.maincolor3,
                        linearStrokeCap: LinearStrokeCap.butt,
                        width: 9,
                        lineHeight: 420,
                        percent: 0,
                        fillColor: Colors.black,
                        backgroundColor: Colors.grey,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 80),
                      ButtomModel(onPressed: () {}, text: "900 Words"),
                      const SizedBox(height: 120),
                      ButtomModel(onPressed: () {}, text: "300 Words"),
                      const SizedBox(height: 150),
                      ButtomModel(onPressed: () {}, text: "100 Words"),
                      const SizedBox(height: 10,)
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
