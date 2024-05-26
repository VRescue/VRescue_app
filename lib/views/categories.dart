import 'package:flutter/material.dart';
import 'package:sangrakshan/data/category_data.dart';
import 'package:sangrakshan/global/color.dart';
import 'package:sangrakshan/models/category.dart';
import 'package:sangrakshan/models/disasters.dart';
import 'package:sangrakshan/views/disaster_screen.dart';
import 'package:sangrakshan/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableDisasters});

  final List<Disasters>  availableDisasters;

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

  void _selectCategory(BuildContext context, Category category) {
    final filteredDisasters = widget.availableDisasters.where((disaster) => disaster.category.contains(category.id)).toList();

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => DisasterScreen(
      title: category.title,
      disasters: filteredDisasters,
    ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VRescue'),
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
              image: Category.image,
              onSelectCategory: (){
                _selectCategory(context, Category);
              },
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