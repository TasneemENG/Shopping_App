import 'package:animal_app/features/Home/presentation/views/widgets/ProductGridView.dart';
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
    'sales/3245285.jpg',
    'sales/3282665.jpg',
    'sales/5028786.jpg',
    'sales/sl_100222_53080_35.jpg',
  ];

  final apiService = api_service(Dio());
  List<Products> popularProducts = [];
  List<Products> flashSaleProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
    getFlashSaleProducts();
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

  Future<void> getFlashSaleProducts() async {
    final homeRepo = RepoHomeImpl(apisevice: apiService);
    final result = await homeRepo.FetchProduct(limit: 10, skip: 3);
    result.fold(
          (failure) {
        print("Error fetching products: ${failure.error}");
        setState(() {
          isLoading = false;
        });
      },
          (productData) {
        setState(() {
          flashSaleProducts = productData;
          isLoading = false;
        });
      },
    );
  }
  Future<void> getMoreProducts() async {
    final homeRepo = RepoHomeImpl(apisevice: apiService);
    final result = await homeRepo.FetchProduct(limit: 12, skip: 20);
    result.fold(
          (failure) {
        print("Error fetching products: ${failure.error}");
        setState(() {
          isLoading = false;
        });
      },
          (productData) {
        setState(() {
          flashSaleProducts = productData;
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 20
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: PopularProductList(
              products: popularProducts,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flash Sale',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                        fontSize: 20
                    ),
                  ),

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: PopularProductList(
              products: flashSaleProducts,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'You might like',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                        fontSize: 30
                    ),
                  ),

                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ProductGridView(
              products: flashSaleProducts,
            ),
          ),
          // Add more Slivers here if needed for additional content
        ],
      ),
    );
  }
}
