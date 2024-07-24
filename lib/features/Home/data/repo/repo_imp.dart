
import 'package:animal_app/features/Home/data/models/Products.dart';
import 'package:animal_app/features/Home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/api_service.dart';
import '../../../../core/errors/failers.dart';

class RepoHomeImpl extends HomeRepo{
  final api_service apisevice;

  RepoHomeImpl({required this.apisevice});

  @override
  Future<Either<failers,List<Products>>> FetchProduct() async {
    try {
      var data = await apisevice.getdata( endpoint: 'products');
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
  Future<Either<failers,List<Products>>> FetchProductCategory(String category) async{

    try {
      var data = await apisevice.getdata( endpoint: 'products/$category');
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