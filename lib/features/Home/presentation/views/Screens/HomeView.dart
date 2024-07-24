import 'package:animal_app/core/api_service.dart';
import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../data/repo/repo_imp.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final api_service apiService = api_service(Dio());
  List<Products>? data = [];

  @override
  void initState() {
    super.initState();
    getproduct();
  }

  Future<void> getproduct() async {
    final homeRepo = RepoHomeImpl(apisevice: apiService);
    final result = await homeRepo.FetchProduct();

    result.fold(
          (failure) {
        // Handle the failure scenario
        print("Error fetching products: ${failure.error}");
      },
          (productData) {
        setState(() {
          data = productData;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Padding(
      padding: const EdgeInsets.only(left: 10,top:25),
      child: Row(
        children: [


          Text("Welcome!",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 2),)
        ],
      ),
    ),

    );
  }
}
