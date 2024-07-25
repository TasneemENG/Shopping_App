import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final PageController pageController;
  final List<String> images;

  const ImageSlider({
    Key? key,
    required this.pageController,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Reduced height for a more compact slider
      child: PageView.builder(
        controller: pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduced padding
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Slightly smaller border radius
              ),
              elevation: 8, // Enhanced shadow effect
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 24, // Increased icon size
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
