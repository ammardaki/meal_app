// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import '../screens/Catergory_Meals_Screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
  void selectedCatergory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CatergoryMealScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedCatergory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(20, 50, 50, 1),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          color: color,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
