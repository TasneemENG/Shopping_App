
import 'package:animal_app/features/Home/presentation/views/widgets/Widget_details.dart';
import 'package:flutter/material.dart';

import '../../../data/models/Products.dart';


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