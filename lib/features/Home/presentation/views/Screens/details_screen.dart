
import 'package:flutter/material.dart';

import '../../../data/models/Products.dart';

import '../widgets/details_widget.dart';

class DetailsScreen extends StatefulWidget {
  final Products product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:

      WidgetDetails(product:widget.product),
    );


  }
}