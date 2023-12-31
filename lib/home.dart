import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled4/ind.dart';
import 'package:untitled4/pages/page1.dart';
import 'package:untitled4/pages/page2.dart';
import 'package:untitled4/pages/page3.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _controller = PageController();

    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage("image/assets/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Column(
                children: [
                  const Text(
                    'Welcome to my app',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: PageView(
                      controller: _controller,
                      children: const [Page1(), Page2(), Page3()],
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: Colors.white, dotColor: Colors.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(onPressed: () {}, child: const Text('fuck off')),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
