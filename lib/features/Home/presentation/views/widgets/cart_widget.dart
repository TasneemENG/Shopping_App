
import 'package:flutter/material.dart';

import '../../../data/models/Dimensions.dart';
import '../../../data/models/Meta.dart';
import '../../../data/models/Products.dart';
import '../../../data/models/Reviews.dart';

class Cart_widgrt extends StatefulWidget {

  static List<Products> favoriteproducts = [];
  static void addFavorite(Products product) {
    if (!favoriteproducts.contains(product)) {
      favoriteproducts.add(product);
      favoriteproducts.remove(product.title);
    }
  }

  static void removeFavorite(Products product) {
    favoriteproducts.remove(product);
  }
  const Cart_widgrt({super.key});

  @override
  State<Cart_widgrt> createState() => _Cart_widgrtState();
}

class _Cart_widgrtState extends State<Cart_widgrt> {

  @override
  double get total {
    return Cart_widgrt.favoriteproducts.fold(
      0.0,
          (sum, product) => sum + (product.price ?? 0.0),
    );
  }
  Widget build(BuildContext context) {
    double totalAmount = total;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cart items',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Cart_widgrt.favoriteproducts.length,
              itemBuilder: (context, index) {
                final product = Cart_widgrt.favoriteproducts[index];
                return Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      ListTile(
                        title: Text(
                          product.title ?? '',
                          style: TextStyle(color: Colors.black),
                          textDirection: TextDirection.rtl,
                        ),
                        leading: Image.network(
                          product.images?.first ?? 'https://via.placeholder.com/150',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20),
                            child: Text(
                              "\$${product.price?.toStringAsFixed(2) ?? '0.00'}",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.orange),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

