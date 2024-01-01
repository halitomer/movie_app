import 'package:flutter/material.dart';

class ContainerTextFiled extends StatelessWidget {
  const ContainerTextFiled({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric( horizontal: 30,vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
