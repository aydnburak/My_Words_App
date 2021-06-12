import 'package:flutter/material.dart';
import 'package:my_words_app/components/%C4%B1nput_word_card.dart';
import 'package:my_words_app/components/save_button.dart';
import 'package:my_words_app/constants/colors.dart';

class AddView extends StatelessWidget {
  AddView({Key? key});

  final _formKey = GlobalKey<FormState>();

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
                    InputWordCard(title: "English", onChanged: (value) {}),
                    InputWordCard(title: "Turkish", onChanged: (value) {}),
                  ],
                ),
              ),
              SaveButton(
                  text: "Add Word",
                  textColor: AppColors.white,
                  backgroundColor: AppColors.green,
                  onTap: () {
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
