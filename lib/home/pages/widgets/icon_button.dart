import 'package:flutter/material.dart';
import 'package:untitled4/Components/colors.dart';

class MyIconButton extends StatelessWidget {
  final Icon myIcon;
  final VoidCallback onTap;
  const MyIconButton({super.key, required this.myIcon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton.icon(onPressed: onTap, icon: myIcon, label: const Text(''),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(100, 50)),
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(AppColors.lightBlack),
          side:  MaterialStateProperty.all(
            const BorderSide(
              color: AppColors.white ,
              width: 1,
            ),
          ),
          shape: MaterialStateProperty.all(

            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
          ),
        ),
      ),
    );

  }
}
