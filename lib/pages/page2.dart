import 'package:flutter/material.dart';

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
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
      ),
    );
  }
}
