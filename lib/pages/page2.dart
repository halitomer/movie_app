import 'package:flutter/material.dart';
import 'package:untitled4/Components/text_style.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(30),
        child: (const Text(
          'the industrys standard dummy text ever since the 1500s, when',
          textAlign: TextAlign.center,
          style: CustomTextStyle.textStyle4,
        )),
      ),
    );
  }
}
