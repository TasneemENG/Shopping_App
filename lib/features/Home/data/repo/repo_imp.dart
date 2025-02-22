import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:animal_app/features/Home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api_service.dart';
import '../../../../core/errors/failers.dart';

class RepoHomeImpl extends HomeRepo {
  final api_service apisevice;

  RepoHomeImpl({required this.apisevice});

  @override
  Future<Either<failers, List<Products>>> FetchProduct({int limit = 10, int skip = 0}) async {
    try {
      final endpoint = 'products?limit=$limit&skip=$skip'; // Modify endpoint for pagination
      var data = await apisevice.getdata(endpoint: endpoint);
      List<Products> productData = [];

      for (var i in data["products"]) {
        productData.add(Products.fromJson(i));
      }
      return right(productData);
    } catch (e) {
      return left(server_error(error: e.toString()));
    }
  }

  @override
  Future<Either<failers, List<Products>>> FetchProductCategory(String category, {int limit = 10, int skip = 0}) async {
    try {
      final endpoint = 'products/category/$category?limit=$limit&skip=$skip'; // Modify endpoint for pagination
      var data = await apisevice.getdata(endpoint: endpoint);
      List<Products> productData = [];

      for (var i in data["products"]) {
        productData.add(Products.fromJson(i));
      }
      return right(productData);
    } catch (e) {
      return left(server_error(error: e.toString()));
    }
  }
}
