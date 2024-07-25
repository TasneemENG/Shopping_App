import 'package:flutter/material.dart';
import 'package:animal_app/features/Home/data/models/Category.dart';

class SmallCategoryWidget extends StatelessWidget {
  final Category category;

  const SmallCategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0), // Reduced margin for smaller spacing
      padding: const EdgeInsets.all(8.0), // Reduced padding inside the container
      decoration: BoxDecoration(
        color: Colors.grey[100], // Background color of the container
        shape: BoxShape.circle, // Makes the container circular
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color
            spreadRadius: 1,
            blurRadius: 3, // Reduced blur radius
            offset: const Offset(0, 2), // Adjusted shadow position
          ),
        ],
      ),
      child: Center(
        child: Text(
          category.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14.0, // Smaller font size
            fontWeight: FontWeight.bold,
            color: Colors.black, // Text color
          ),
        ),
      ),
    );
  }
}
