import 'package:flutter/material.dart';
import '../../../data/models/Products.dart';
import '../Screens/details_screen.dart';

class ProductCard extends StatelessWidget {
  final Products product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(product: product,)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
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
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                    child: Stack(
                      children: [
                        Image.network(
                          product.thumbnail ?? 'https://via.placeholder.com/150',
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Center(
                              child: Text(
                                product.title ?? 'Product Title',
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
                      icon: const Icon(Icons.shopping_cart, color: Colors.white, size: 28),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(height: 12.0),
                    Text(
                      '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
