import 'package:flutter/material.dart';
import 'package:my_words_app/components/my_background.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBackGround(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
