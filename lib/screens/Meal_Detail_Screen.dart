// ignore_for_file: use_key_in_widget_constructors, file_names, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "Meal_Detail";
  Widget buildSelectionTitle(BuildContext ctx, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: Theme.of(ctx).textTheme.titleMedium,
      ),
    );
  }

  Widget bulidContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
            10.0,
          )),
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      height: 150.0,
      width: 300.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final SelectMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.pink, title: Text(SelectMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              child: Image.network(
                SelectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectionTitle(context, "Ingredient"),
            bulidContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: Text(SelectMeal.ingredients[index]),
                    ),
                  );
                }),
                itemCount: SelectMeal.ingredients.length,
              ),
            ),
            buildSelectionTitle(context, "Steps"),
            bulidContainer(
              ListView.builder(
                itemCount: SelectMeal.steps.length,
                itemBuilder: ((ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink,
                      child: Text("#${index + 1}"),
                    ),
                    title: Text(SelectMeal.steps[index]),
                  );
                }),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
