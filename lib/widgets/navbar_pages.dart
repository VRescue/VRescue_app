import 'package:flutter/material.dart';
import 'package:sangrakshan/views/categories.dart';
import 'package:sangrakshan/views/quiz.dart';
import 'package:sangrakshan/widgets/navbar.dart';



class NavScreen extends StatefulWidget {
  static const routeName = "/tabScreen";
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final _pages = [
    const CategoriesScreen(),
    const QuizScreen(),
  ];

  var _selected = 0;

  void _changeScreen(val) {
    setState(() {
      _selected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(idx: _selected, change: _changeScreen),
      body: _pages[_selected],
    );
  }
}