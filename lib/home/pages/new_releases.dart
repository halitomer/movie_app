import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterflow_paginate_firestore/bloc/pagination_listeners.dart';
import 'package:flutterflow_paginate_firestore/paginate_firestore.dart';
import 'package:untitled4/Components/text_style.dart';
import 'package:untitled4/home/pages/models/movie.dart';

import '../../Components/colors.dart';

class NewReleases extends StatefulWidget {
  const NewReleases({Key? key}) : super(key: key);

  @override
  State<NewReleases> createState() => _NewReleasesState();
}

class _NewReleasesState extends State<NewReleases> {
  List<Movie> movies = [];
  PaginateRefreshedChangeListener refreshChangeListener =
      PaginateRefreshedChangeListener();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Releases',
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
      body: RefreshIndicator(
        color: AppColors.red,
        onRefresh: () async {
          refreshChangeListener.refreshed = true;
        },
        child: PaginateFirestore(
          itemsPerPage: 5,
          itemBuilderType: PaginateBuilderType.gridView,
          itemBuilder: (context, documentSnapshot, index) {
            // final data = (documentSnapshot as DocumentSnapshot).data() as Map<String, dynamic>;
            final data = documentSnapshot[index].data() as Map?;

            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: data?['image'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
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
                          child: Text(data?['rate'],
                              style: CustomTextStyle.textStyle1
                                  .copyWith(fontSize: 10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          query: FirebaseFirestore.instance
              .collection('movies')
              .where('category', isEqualTo: 'newest'),
          listeners: [
            refreshChangeListener,
          ],
          isLive: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
          ),
        ),
      ),
    );
  }
}
