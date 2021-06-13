import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_words_app/components/my_background.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:my_words_app/controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBackGround(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () async {
                await _authController.singInWithGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}
