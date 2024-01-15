import 'package:flutter/material.dart';
import 'package:untitled4/Components/text_style.dart';
import '../../../Components/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Image.asset(
          "assets/images/homepage.jpg",
          height: 300,
          fit: BoxFit.fitHeight,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
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
              const SizedBox(
                height: 100,
              ),
              Text(
                'Money Heist',
                textAlign: TextAlign.end,
                style: CustomTextStyle.textStyle5,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 210,
                child: Text(
                  'Heist, Crime, Drama, Thriller Heist, Crime, drama, Thriller Heist, Crime, drama, Thriller Heist, Crime, drama, Thriller ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyle.textStyle6,
                ),
              ),
              Row(children: [
                ElevatedButton.icon(
                  label: Text(
                    'Play',
                    style: CustomTextStyle.textStyle1,
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.red),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    Icons.play_arrow,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: Text(
                    'My List',
                    style: CustomTextStyle.textStyle1,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(
                        width: 1.0,
                        color: AppColors.white,
                      )),
                )
              ])
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 50),
          child: ImageIcon(
            AssetImage(
              'assets/images/newl.png',
            ),
            color: AppColors.red,
          ),
        ),
      ],
    );
  }
}
