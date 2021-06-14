import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_words_app/components/%C4%B1nput_word_card.dart';
import 'package:my_words_app/components/save_button.dart';
import 'package:my_words_app/constants/colors.dart';
import 'package:my_words_app/controllers/auth_controller.dart';
import 'package:my_words_app/controllers/words_controller.dart';
import 'package:my_words_app/models/word.dart';

class AddView extends StatefulWidget {
  AddView({Key? key});

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final _formKey = GlobalKey<FormState>();
  final WordsController _wordsController = Get.find();
  final AuthController _authController = Get.find();
  String en = "";

  String tr = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: height * 0.15),
              Container(
                height: height * 0.5,
                child: Column(
                  children: [
                    InputWordCard(
                        title: "English",
                        onChanged: (value) {
                          en = value;
                        }),
                    InputWordCard(
                        title: "Turkish",
                        onChanged: (value) {
                          tr = value;
                        }),
                  ],
                ),
              ),
              SaveButton(
                  text: "Add Word",
                  textColor: AppColors.white,
                  backgroundColor: AppColors.green,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _wordsController
                          .addWord(Word(userID: _authController.myUser!.userID, tr: tr, en: en));
                      _formKey.currentState!.reset();
                    }
                    print("save click");
                  }),
              SizedBox(height: height * 0.02)
            ],
          ),
        ),
      ),
    );
  }
}
