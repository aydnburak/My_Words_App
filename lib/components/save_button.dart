import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  const SaveButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.backgroundColor,
      required this.onTap,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.08,
        width: width * 0.5,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: AutoSizeText(
            text,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: textColor),
          ),
        ),
      ),
    );
  }
}
