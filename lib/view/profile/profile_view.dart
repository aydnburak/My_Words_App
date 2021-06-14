import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:my_words_app/controllers/auth_controller.dart';
import 'package:my_words_app/controllers/my_page_controller.dart';
import 'package:my_words_app/controllers/words_controller.dart';

class ProfilView extends StatelessWidget {
  ProfilView({Key? key});

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find();
    final MyPageController _myPageController = Get.find();
    final WordsController _wordsController = Get.find();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Name: " + _authController.myUser!.name!,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: height * 0.02),
        Text(
          "Email: " + _authController.myUser!.email!,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: height * 0.1),
        Container(
          height: height * 0.05,
          width: width * 0.7,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Obx(() {
              return Text(
                "All My Words: ${_wordsController.allWords.length.toString()}",
                style: TextStyle(fontSize: 20),
              );
            }),
          ),
        ),
        SizedBox(height: height * 0.1),
        ElevatedButton(
            onPressed: () async {
              await _authController.singOut();
              _myPageController.pageUpdate = 1;
            },
            style: ElevatedButton.styleFrom(primary: AppColors.red),
            child: Text("Çıkış"))
      ],
    );
  }
}
