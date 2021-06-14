import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_words_app/components/answer_button.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:my_words_app/controllers/words_controller.dart';

class Answers extends StatelessWidget {
  final double height;
  final double margin;

  const Answers({Key? key, required this.height, required this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WordsController _wordsController = Get.find();
    return Container(
      height: height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                AnswerButton(margin: margin, index: 0),
                AnswerButton(margin: margin, index: 1),
              ],
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              AnswerButton(margin: margin, index: 2),
              AnswerButton(margin: margin, index: 3),
            ]),
          ),
        ],
      ),
    );
  }
}
