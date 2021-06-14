import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_words_app/components/answers.dart';
import 'package:my_words_app/components/next_button.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:my_words_app/controllers/words_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final WordsController _wordsController = Get.find();

    return Obx(() {
      return _wordsController.isQuestion.value == true
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.05, horizontal: width * 0.05),
              child: Column(
                children: <Widget>[
                  _buildSetting(height, width),
                  _buildQuestionDetail(height),
                  Answers(margin: height * 0.025, height: height * 0.30),
                  SizedBox(height: height * 0.07),
                  _buildNext(height)
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            );
    });
  }

  Widget _buildNext(double height) {
    final WordsController _wordsController = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        NextButton(
            height: height * 0.11,
            onTap: () {
              _wordsController.getQuestion();
            })
      ],
    );
  }

  Widget _buildQuestionDetail(double height) {
    final WordsController _wordsController = Get.find();
    return Container(
      height: height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "Correct Score: ${_wordsController.correctScore.value}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
              ),
              AutoSizeText(
                "Wrong Score: ${_wordsController.wrongScore.value}",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
              ),
            ],
          ),
          SizedBox(height: height * 0.05),
          AutoSizeText(
            "What does the word '${_wordsController.question.question.tr}' mean in English?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSetting(double height, double width) {
    final WordsController _wordsController = Get.find();
    return Container(
      height: height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh, color: AppColors.white),
            onPressed: () {
              _wordsController.testReset();
            },
          ),
          ToggleSwitch(
            minHeight: height * 0.05,
            minWidth: width * 0.15,
            initialLabelIndex: 0,
            activeBgColor: [AppColors.green],
            inactiveBgColor: Colors.grey,
            totalSwitches: 2,
            labels: ['All', 'Last'],
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
        ],
      ),
    );
  }
}
