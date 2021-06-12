import 'package:flutter/material.dart';
import 'package:my_words_app/constants/colors.dart';

class InputWordCard extends StatelessWidget {
  final Function(String) onChanged;
  final String title;

  const InputWordCard({Key? key, required this.title, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 25, color: AppColors.white, fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          onChanged: onChanged,
          validator: (value) {
            if (value != null) {
              if (value.isEmpty) {
                return 'Boş Olamaz';
              }
            }
          },
          style: TextStyle(fontSize: 30),
          minLines: 2,
          maxLength: 30,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25),
                borderSide: BorderSide.none,
              )),
          keyboardType: TextInputType.multiline,
          maxLines: 30,
        ),
      ],
    );
  }
}
