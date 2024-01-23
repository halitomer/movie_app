import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled4/Components/text_style.dart';
import 'package:untitled4/home/pages/home_page.dart';
import 'package:untitled4/home/pages/data/types_data.dart';
import '../../Components/colors.dart';

class InterestPage extends StatefulWidget {
  InterestPage({
    super.key,
  });

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  List values = types.map((e) => false).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
        ),
        title: Text('Chose your interest', style: CustomTextStyle.textStyle7),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: types.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ChoiceChip(
                  selected: values[index],
                  onSelected: (bool selected) {
                    setState(() {
                      values[index] = selected;
                    });
                  },
                  label: Text(types[index],
                      style: const TextStyle(color: AppColors.white)),
                  selectedColor: AppColors.red,
                  backgroundColor: AppColors.lightBlack,
                  side: const BorderSide(
                    color: AppColors.white,
                    width: 1,
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 1,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => HomePage()));
                },
                child:  Text('Next',style: CustomTextStyle.textStyle1,),
                style: ElevatedButton.styleFrom(
                   backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
