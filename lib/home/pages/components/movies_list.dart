import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../Components/colors.dart';
import '../../../Components/text_style.dart';
import '../top_movies.dart';

class MoviesList extends StatelessWidget {
  final List<Map> movies;
  final String title;

  const MoviesList({
    super.key,
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
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopMovies(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'See All',
                style: CustomTextStyle.textStyle2,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: movies
                .take(5)
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: e['image'],
                            fit: BoxFit.cover,
                            width: 150,
                            height: 250,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              height: 20,
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