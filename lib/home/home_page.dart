
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:untitled4/home/pages/components/movies_list.dart';
import 'package:untitled4/home/pages/new_releases.dart';
import 'package:untitled4/home/pages/top_movies.dart';

import 'pages/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance;
  List<Map> movies = [];
  List<Map> newMovies = [];

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
    db.collection("new_movies").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          newMovies.add(docSnapshot.data());
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
              const SizedBox(
                height: 5,
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
                movies: movies,
                title: 'Top 10 Movies This Week',
              ),
              const SizedBox(
                height: 5,
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
                movies: newMovies,
                title: 'New Releases',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
