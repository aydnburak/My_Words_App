import 'package:flutter/material.dart';
import 'package:my_words_app/components/answer_button.dart';
import 'package:my_words_app/constants/colors.dart';

class Answers extends StatelessWidget {
  final double height;
  final double margin;

  const Answers({Key? key, required this.height, required this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              AnswerButton(
                  text: "Cevabım",
                  textColor: AppColors.white,
                  margin: margin,
                  backgroundColor: AppColors.red,
                  onTap: () {}),
              AnswerButton(
                  text: "Cevabım",
                  textColor: AppColors.black,
                  margin: margin,
                  backgroundColor: AppColors.white,
                  onTap: () {}),
            ]),
          ),
          Expanded(
            child: Row(children: <Widget>[
              AnswerButton(
                  text: "Cevabım",
                  textColor: AppColors.black,
                  margin: margin,
                  backgroundColor: AppColors.white,
                  onTap: () {}),
              AnswerButton(
                  text: "Cevabım",
                  textColor: AppColors.white,
                  margin: margin,
                  backgroundColor: AppColors.green,
                  onTap: () {}),
            ]),
          ),
        ],
      ),
    );
  }
}
