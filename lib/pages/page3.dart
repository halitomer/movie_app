import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        margin: EdgeInsets.all(30),

        child: (const Text(
            'unknown printer took a galley of type and scrambled it to make a type specimen book',
          style: TextStyle(
              fontSize: 20, color: Colors.white
          ),
        )),
      ),
    );
  }
}
