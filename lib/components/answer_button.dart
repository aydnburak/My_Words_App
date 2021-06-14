import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:my_words_app/controllers/words_controller.dart';

class AnswerButton extends StatelessWidget {
  final double margin;
  final int index;

  const AnswerButton({
    Key? key,
    required this.margin,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WordsController _wordsController = Get.find();
    var _answer = _wordsController.question.answers[index];
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(margin),
        child: InkWell(
          onTap: () {
            _wordsController.soruKontrol(index);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _answer.isActive == null
                  ? AppColors.white
                  : _answer.isActive == true
                      ? AppColors.green
                      : AppColors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: AutoSizeText(
                _answer.en,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _answer.isActive == null ? AppColors.black : AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
