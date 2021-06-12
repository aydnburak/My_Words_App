import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_words_app/components/answers.dart';
import 'package:my_words_app/components/next_button.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
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
    );
  }

  Widget _buildNext(double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        NextButton(
            height: height * 0.11,
            onTap: () {
              print("next click");
            })
      ],
    );
  }

  Widget _buildQuestionDetail(double height) {
    return Container(
      height: height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "Correct Score: 0",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
              ),
              AutoSizeText(
                "Wrong Score: 0",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
              ),
            ],
          ),
          SizedBox(height: height * 0.05),
          AutoSizeText(
            "What does the word 'tatlı' mean in English?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSetting(double height, double width) {
    return Container(
      height: height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh, color: AppColors.white),
            onPressed: () {},
          ),
          Text(
            "Question 1",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.white),
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
