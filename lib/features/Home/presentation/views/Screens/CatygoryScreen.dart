import 'package:animal_app/features/Home/presentation/views/widgets/cateory.dart';
import 'package:flutter/material.dart';
import '../../../data/models/Category.dart';


class CategoryScreen extends StatefulWidget {
  final List<Category> categories;

  const CategoryScreen({super.key, required this.categories});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: ListView.builder(
        itemCount: categories.length, // Number of cards you want to display
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryCard(category: categories[index] ),
          );
        },
      ),
    );
  }
}

