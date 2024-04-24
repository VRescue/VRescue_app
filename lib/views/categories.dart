import 'package:flutter/material.dart';
import 'package:sangrakshan/data/category_data.dart';
import 'package:sangrakshan/global/color.dart';
import 'package:sangrakshan/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key,});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SANGRAKSHAN'),
        centerTitle: true,
      ),
      backgroundColor: klightPurple,
      body: SafeArea(
      child: AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3/2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            ),
          children: [
            for(final Category in availableCategories)
            CategoryGridItem(
              title: Category.title,
              icon: Icons.category,
              color: Colors.blue,
            ),
          ],
        ),
        builder: (Context, child) => SlideTransition(
          position:Tween(
            begin: Offset(0, 0.3),
            end: Offset(0,0),
          ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),),
          child: child,),
        ),
    ),);
  }
}