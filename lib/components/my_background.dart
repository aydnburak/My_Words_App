import 'package:flutter/material.dart';
import 'package:my_words_app/constants/colors.dart';

class MyBackGround extends StatelessWidget {
  final Widget child;

  const MyBackGround({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.purple, AppColors.pink],
        ),
      ),
      child: child,
    );
  }
}
