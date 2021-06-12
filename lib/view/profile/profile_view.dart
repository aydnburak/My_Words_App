import 'package:flutter/material.dart';
import 'package:my_words_app/constants/colors.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: height * 0.05,
          width: width * 0.7,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              "All My Words: 524",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: height * 0.05,
          width: width * 0.7,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              "My Last Words: 10",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
