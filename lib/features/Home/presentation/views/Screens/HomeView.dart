import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:dio/dio.dart';

import 'package:animal_app/core/api_service.dart';
import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:animal_app/features/Home/data/models/Category.dart';
import 'package:animal_app/features/Home/data/repo/repo_imp.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/ImageSlider.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/category_list.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/popularProductList.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  final List<String> images = [
    'sales/15811.jpg',
    'sales/2952268.jpg',
    'sales/3245285.jpg',
    'sales/3282665.jpg',
    'sales/5028786.jpg',
    'sales/full-shot-woman-holding-sale-tag.jpg',
    'sales/sl_100222_53080_35.jpg',
  ];

  final apiService = api_service(Dio());
  List<Products> popularProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    final homeRepo = RepoHomeImpl(apisevice: apiService);
    final result = await homeRepo.FetchProduct(limit: 5, skip: 10);
    result.fold(
          (failure) {
        print("Error fetching products: ${failure.error}");
        setState(() {
          isLoading = false;
        });
      },
          (productData) {
        setState(() {
          popularProducts = productData;
          isLoading = false;
        });
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "category image/WhatsApp Image 2024-07-25 at 02.58.59_88c7ec32.jpg",
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.orange,
            onPressed: () {
              // Add functionality for notifications button
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ImageSlider(
                pageController: _pageController,
                images: images,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: HorizontalCategoryList(
                categories: categories, // Ensure `categories` is defined or fetched
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Popular Products',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: PopularProductList(
              products: popularProducts,
            ),
          ),
          // Add more Slivers here if needed for additional content
        ],
      ),
    );
  }
}
