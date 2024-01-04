import 'package:flutter/material.dart';
import 'package:untitled4/Components/text_style.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(30),
        child: (const Text(
          'unknown printer took a galley of type and scrambled it to make a type specimen book',
          textAlign: TextAlign.center,
          style: CustomTextStyle.textStyle4,
        )),
      ),
    );
  }
}
