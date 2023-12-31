import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'home.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});


  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  /// this color for background
  final Color lightBlack = const Color.fromARGB(255, 34, 37, 46);
  final  Color white = const Color(0xFFFFFFFF);



  @override
  void initState() {
    super.initState();
    _navigteToHome();
  }
  _navigteToHome() async{
    await Future.delayed(const Duration(milliseconds: 3000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>  MyHomePage() ));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: lightBlack ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10, height: 10,),
            Center(

                child: Container(
                  child: Image.asset('image/assets/newl.png',
                    width: 200, height: 200,
                ),
                ),
              ),

          const SizedBox(height: 250, width: 250,),
        LoadingAnimationWidget.hexagonDots(color: white, size: 50),



          ],
        ),
      ),
    );
  }
}
