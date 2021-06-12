import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final double margin;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const AnswerButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.margin,
      required this.backgroundColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(margin),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: AutoSizeText(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
