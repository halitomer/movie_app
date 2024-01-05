import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled4/splash.dart';

import 'Components/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
       builder: (context, child) =>  MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.lightBlack, elevation: 0),
            scaffoldBackgroundColor: AppColors.lightBlack),
        home: const Splash(),
      ),
    );
  }
}
