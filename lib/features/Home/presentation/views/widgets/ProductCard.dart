import 'package:flutter/material.dart';
import '../../../data/models/Products.dart';

class ProductCard extends StatelessWidget {
  final Products product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Rounded corners
      ),
      color: Colors.white,
      elevation: 8,
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)), // Rounded top corners for image
                child: Stack(
                  children: [
                    Image.network(
                      product.thumbnail ?? 'https://via.placeholder.com/150', // Placeholder image if null
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 40,
                        ),
                      ), // Handle image loading errors
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.3), // Gradient overlay
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: Center(
                          child: Text(
                            product.title ?? 'Product Title', // Placeholder if title is null
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.white, size: 28),
                  onPressed: () {
                    // Handle cart icon press
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center stars horizontally
                  children: List.generate(
                    5,
                        (index) => Icon(
                      index < (product.rating ?? 0).toInt()
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.orange,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0), // Space between rating and price
                Text(
                  '\$${product.price?.toStringAsFixed(2) ?? '0.00'}', // Default price if null
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center, // Center price text
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
