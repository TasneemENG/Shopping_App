import 'package:flutter/material.dart';
import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/ProductGridView.dart'; // Ensure this import path is correct
import 'package:animal_app/core/api_service.dart';
import 'package:dio/dio.dart';
import '../../../data/repo/repo_imp.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final api_service apiService = api_service(Dio());
  List<Products>? data = [];
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    final homeRepo = RepoHomeImpl(apisevice: apiService);
    final result = await homeRepo.FetchProduct();

    result.fold(
          (failure) {
        setState(() {
          isLoading = false;
          hasError = true;
          errorMessage = "Error fetching products: ${failure.error}";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      },
          (productData) {
        setState(() {
          data = productData;
          isLoading = false;
        });
      },
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });
    await getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.orange,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.stacked_line_chart),
            color: Colors.orange,
            onPressed: () {
              // Add functionality for forward button
            },
          ),
        ],
      ),
      body: null
    );
  }
}
