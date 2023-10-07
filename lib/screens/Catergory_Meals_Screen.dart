// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CatergoryMealScreen extends StatefulWidget {
  static const routeName = "CategoryMeals";
  const CatergoryMealScreen({super.key});

  @override
  State<CatergoryMealScreen> createState() => _CatergoryMealScreenState();
}

class _CatergoryMealScreenState extends State<CatergoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routArg['id'];
    final categeorytitle = routArg["title"];
    final cateoryMeal = DUMMY_MEALS.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(categeorytitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: cateoryMeal[index].id,
            imageUrl: cateoryMeal[index].imageUrl,
            title: cateoryMeal[index].title,
            duration: cateoryMeal[index].duration,
            Complexit: cateoryMeal[index].complexity,
            Affordabilit: cateoryMeal[index].affordability,
          );
        }),
        itemCount: cateoryMeal.length,
      ),
    );
  }
}
