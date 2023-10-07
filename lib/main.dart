// ignore_for_file: unused_import, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:meal_app/screens/Meal_Detail_Screen.dart';
import 'package:meal_app/screens/tab_screen.dart';
import './screens/Catergory_Meals_Screen.dart';
import './screens/Catergroy_Screen.dart';
import './screens/screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
                fontSize: 30.0,
                fontWeight: FontWeight.bold),

            //     bodyText1: TextStyle(
            //       color: Color.fromRGBO(20, 50, 50, 1),
            //     ),
            // titleLarge: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
            titleMedium:
                TextStyle(fontSize: 24.0, fontFamily: "RobotoCondensed")),
      ),
      debugShowCheckedModeBanner: false,
      // home: CateoryScreen(),
      routes: {
        "/": (ctx) => TabScreen(),
        CatergoryMealScreen.routeName: (context) => CatergoryMealScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
    );
  }
}
