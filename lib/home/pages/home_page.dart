import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:untitled4/home/pages/components/movies_list.dart';
import 'package:untitled4/home/pages/models/movie.dart';
import 'package:untitled4/home/pages/new_releases.dart';
import 'package:untitled4/home/pages/top_movies.dart';

import 'widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance;
  List<Movie> movies = [];

  @override
  void initState() {
    db.collection("movies").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          movies.add(Movie.fromJson(docSnapshot.data()));
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
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              const CustomAppBar(),
              SizedBox(
                height: 5.h,
              ),
              MoviesList(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TopMovies(),
                    ),
                  );
                },
                movies: movies
                    .where((element) => element.category == MovieType.popular)
                .take(5)
                    .toList(),
                title: 'Top 10 Movies This Week',
              ),
              SizedBox(
                height: 5.h,
              ),
              MoviesList(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewReleases(),
                    ),
                  );
                },
                movies: movies.where((element) => element.category == MovieType.newest).take(5).toList(),
                title: 'New Releases',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
