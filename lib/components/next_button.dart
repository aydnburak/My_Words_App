import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final double height;
  final VoidCallback onTap;

  const NextButton({Key? key, required this.height, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: InkWell(
        onTap: onTap,
        child: Card(
          margin: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child:
                AutoSizeText("Next", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
