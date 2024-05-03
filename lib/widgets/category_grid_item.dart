import 'package:flutter/material.dart';
import 'package:sangrakshan/global/color.dart';

class CategoryGridItem extends StatelessWidget {
  final String title;
  final String image;
  final void Function() onSelectCategory;

  const CategoryGridItem({
    required this.title,
    required this.image,
    required this.onSelectCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
  elevation: 4,
  child: InkWell(
    onTap: onSelectCategory,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
            colorBlendMode: BlendMode.darken,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kwhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
  }
}