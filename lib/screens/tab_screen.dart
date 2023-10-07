// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/screens/Catergroy_Screen.dart';
import 'package:meal_app/screens/favorit_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': CateoryScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritScreen(),
      'title': 'Your Favorit',
    }
  ];

  int SelectPageIndex = 0;
  void _selectPages(int indext) {
    setState(() {
      SelectPageIndex = indext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(_pages[SelectPageIndex]['title']),
        backgroundColor: Colors.transparent,
      ),
      body: _pages[SelectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          currentIndex: SelectPageIndex,
          onTap: _selectPages,
          // type: BottomNavigationBarType.shifting,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
          ]),
    );
  }
}
