import 'package:flutter/material.dart';
import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/ProductCard.dart';

class ProductGridView extends StatelessWidget {
  final List<Products> products;

  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 2.0, // Horizontal spacing between items
          mainAxisSpacing: 2.0, // Vertical spacing between items
          childAspectRatio: 0.6, // Aspect ratio of each item
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
