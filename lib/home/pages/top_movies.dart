import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/Components/text_style.dart';

import '../../Components/colors.dart';

class TopMovies extends StatefulWidget {
  const TopMovies({super.key});

  @override
  State<TopMovies> createState() => _TopMoviesState();
}

class _TopMoviesState extends State<TopMovies> {
  final db = FirebaseFirestore.instance;
  List<Map> movies = [];

  @override
  void initState() {
    db.collection("movies").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          movies.add(docSnapshot.data());
        }
        setState(() {});
      },
      onError: (e) => print("Error completing: $e"),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top 10 Movies This Week',
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
        ),
      ),
      body: GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.5,
        ),
        children: movies
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
                        width: double.infinity,
                        height: double.infinity,
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
    );
  }
}
