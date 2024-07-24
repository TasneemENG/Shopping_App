import 'package:flutter/material.dart';
import 'package:animal_app/features/Home/data/models/Category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              // Background image
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  category.imageUrl, // Ensure this path is correct
                  fit: BoxFit.cover,
                  height: 180, // Adjust the height as needed
                  width: double.infinity, // Ensure the width covers the card's width
                ),
              ),
              // Centered title
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black54, // Semi-transparent background to make text readable
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Ensure the text color is visible on the background
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
