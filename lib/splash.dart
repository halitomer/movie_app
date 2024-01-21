import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:untitled4/Components/colors.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigteToHome();
  }

  _navigteToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              width: 10.w,
              height: 10.h,
            ),
            Center(
              child: Container(
                child: Image.asset(
                  'assets/images/newl.png',
                  width: 200.w,
                  height: 200.h,
                ),
              ),
            ),
             SizedBox(
              height: 250.h,
              width: 250.w,
            ),
            LoadingAnimationWidget.hexagonDots(
                color: AppColors.white, size: 50),
          ],
        ),
      ),
    );
  }
}
