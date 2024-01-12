import 'package:flutter/material.dart';
import 'package:untitled4/Components/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       ListView(
        children: const [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Image(
                image: AssetImage("image/assets/homepage.jpg"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.search,
                            size: 30,
                            color: AppColors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.notifications_active_outlined,
                            size: 30,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 75,
                    ),
                    Text(
                      'Money Heist',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Heist, Crime, drama, Thriller....',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 50),
                child: ImageIcon(
                  AssetImage(
                    'image/assets/newl.png',
                  ),
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
