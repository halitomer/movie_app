import 'package:flutter/material.dart';
import 'package:untitled4/Components/colors.dart';

import '../../../Components/text_style.dart';

class MyIconButton extends StatelessWidget {
  final Text text;
  final Icon myIcon;
  final VoidCallback onTap;

  const MyIconButton(
      {super.key, required this.myIcon, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ElevatedButton.icon(onPressed: onTap, icon: myIcon, label: text,

          style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(AppColors.red),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    ),
    );


  }
}
