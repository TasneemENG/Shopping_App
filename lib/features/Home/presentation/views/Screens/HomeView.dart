import 'package:animal_app/features/Home/presentation/views/Screens/CatygoryScreen.dart';
import 'package:animal_app/features/Home/presentation/views/widgets/ProductGridView.dart';
import 'package:animal_app/features/authentication/presentation/views/screens/create_account_view.dart';
import 'package:animal_app/features/authentication/presentation/views/screens/login_view.dart';
import 'package:flutter/material.dart';
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
  List<Products> likeProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
    getFlashSaleProducts();
    getMoreProducts();
  }

  Future<void> getProducts() async {
    final homeRepo = RepoHomeImpl(apisevice: apiService);
    final result = await homeRepo.FetchProduct(limit: 10, skip: 10);
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
    final result = await homeRepo.FetchProduct(limit: 20, skip: 0);
    result.fold(
          (failure) {
        print("Error fetching products: ${failure.error}");
        setState(() {
          isLoading = false;
        });
      },
          (productData) {
        setState(() {
          likeProducts = productData;
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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.orange),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Use the Builder context
              },
            );
          },
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
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer header with image
            UserAccountsDrawerHeader(
              accountName: const Text('User Name'),
              accountEmail: const Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('sales/a2020cf5-9244-4244-8b8b-46186a571545.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.orange),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                // You are already on Home, so no need to navigate
              },
            ),
            ListTile(
              leading: const Icon(Icons.category, color: Colors.orange),
              title: const Text('Categories'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.orange),
              title: const Text('Sign Up'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Create_account()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.login_rounded, color: Colors.orange),
              title: const Text('Login'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login_view()),
                );
              },
            ),
          ],
        ),
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
              child: Text(
                'Popular Products',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 20
                ),
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
              child: Text(
                'Flash Sale',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 20
                ),
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
              child: Text(
                'You might like',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ProductGridView(
              products: likeProducts,
            ),
          ),
        ],
      ),
    );
  }
}