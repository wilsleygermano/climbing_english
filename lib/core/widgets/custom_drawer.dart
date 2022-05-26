import 'dart:ui';

import 'package:climbing_english/core/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DrawerStyle(),
      child: Container(
        decoration: BoxDecoration(
        color: Colors.grey.shade700),
        width: 300,
        height: 700,
        child: Stack(
          children: <Widget>[
            BackdropFilter(
              filter: ImageFilter.blur(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/drawer.png"),
                    fit: BoxFit.fill,
                    opacity: 0.4
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerStyle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

path.moveTo(size.width*0.0028571,size.height*0.0037500);
    path.lineTo(size.width*0.9185714,size.height*0.1062500);
    path.lineTo(size.width*0.6985714,size.height*0.2475000);
    path.lineTo(size.width*0.9128571,size.height*0.3587500);
    path.lineTo(size.width*0.7342857,size.height*0.4837500);
    path.lineTo(size.width*0.8985714,size.height*0.6050000);
    path.lineTo(size.width*0.7185714,size.height*0.6850000);
    path.lineTo(size.width*0.8771429,size.height*0.8150000);
    path.lineTo(size.width*0.0028571,size.height*0.9987500);


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
