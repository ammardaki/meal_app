// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, non_constant_identifier_names, dead_code, unnecessary_string_interpolations

import 'dart:ui';

import 'package:flutter/material.dart';
import '../screens/Meal_Detail_Screen.dart';
import '../model/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity Complexit;
  final Affordability Affordabilit;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.Complexit,
    required this.Affordabilit,
  });
  String get ComplexityText {
    switch (Complexit) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unknown";
        break;
    }
  }

  String get AffordabilitText {
    switch (Affordabilit) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "unknown";
        break;
    }
  }

  void selectmeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 20.0,
                  child: Container(
                    width: 300.0,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule_outlined,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "$duration min",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "$ComplexityText",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "$AffordabilitText",
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
