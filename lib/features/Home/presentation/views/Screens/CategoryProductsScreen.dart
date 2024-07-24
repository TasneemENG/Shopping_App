import 'package:flutter/material.dart';
import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:animal_app/features/Home/data/models/Category.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/ProductGridView.dart'; // Import the new widget
import 'package:animal_app/core/api_service.dart';
import 'package:dio/dio.dart';
import '../../../data/repo/repo_imp.dart';

class CategoryProductsScreen extends StatefulWidget {
  final Category category;

  const CategoryProductsScreen({super.key, required this.category});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final api_service apiService = api_service(Dio());
  List<Products> data = []; // Initialize as an empty list
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProductsByCategory();
  }

  Future<void> getProductsByCategory() async {
    final homeRepo = RepoHomeImpl(apisevice: apiService);
    final result = await homeRepo.FetchProductCategory(widget.category.name);

    result.fold(
          (failure) {
        print("Error fetching products: ${failure.error}");
        // Handle error state here, maybe set `isLoading` to false
        setState(() {
          isLoading = false;
        });
      },
          (productData) {
        setState(() {
          data = productData;
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.category.name,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ProductGridView(products: data), // Pass data directly
    );
  }
}
