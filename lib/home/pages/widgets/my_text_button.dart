import 'package:flutter/material.dart';

import '../../../Components/text_style.dart';

class MyTextButton extends StatelessWidget {
   final VoidCallback onTap;
   final Text text;



   MyTextButton({super.key, required this.onTap, required this.text });

  @override
  Widget build(BuildContext context) {
      return  TextButton(
      onPressed: onTap ,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text.data.toString(),
        style: CustomTextStyle.textStyle2,
      ),
    );
  }
}
