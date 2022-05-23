import 'package:flutter/material.dart';

import '../../features/home/view/my_home_page.dart';

class ClimbingEnglishApp extends StatelessWidget {
  const ClimbingEnglishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}