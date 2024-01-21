import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled4/home/pages/widgets/my_text_button.dart';

import '../../../Components/colors.dart';
import '../../../Components/text_style.dart';


class MoviesList extends StatelessWidget {
  final List<Map> movies;
  final String title;
  final VoidCallback onTap;


  const MoviesList({
    super.key,
    required this.onTap,
    required this.movies,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                title,
                style: CustomTextStyle.textStyle4,
              ),
            ),
            const Spacer(),
            MyTextButton(onTap: onTap,text:  Text('See All'), )

          ],
        ),
        SizedBox(
          height: 250.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: movies
                .take(5)
                .map(
                  (e) => Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: e['image'],
                            fit: BoxFit.cover,
                            width: 150.w,
                            height: 250.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(e['rate'].toString(),
                                    style: CustomTextStyle.textStyle1
                                        .copyWith(fontSize: 10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
