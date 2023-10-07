// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/Category_item.dart';

class CateoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        // ignore: prefer_const_constructors
        image: DecorationImage(
            image: AssetImage(
              "assets/images/ffod.jpg",
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text("Meals"),
          centerTitle: true,
        ),
        body: GridView(
          padding: const EdgeInsets.all(25.0),
          // ignore: sort_child_properties_last
          children: DUMMY_CATEGORIES
              .map((cateData) =>
                  CategoryItem(cateData.id, cateData.title, cateData.color))
              .toList(),

          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
        ),
      ),
    );
  }
}
