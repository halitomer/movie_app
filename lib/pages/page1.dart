import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        margin: EdgeInsets.all(30),
        
        child: (const Text(
          'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been',style: TextStyle(
          fontSize: 20,
            color: Colors.white
        ),
        )),
      ),
    );
  }
}
