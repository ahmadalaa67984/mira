import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeHorizontalCarousel extends StatelessWidget {
  final List<String> imageUrls;

  HomeHorizontalCarousel({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0, // Height of the carousel
        autoPlay: true, // Enable auto-scroll
        enlargeCenterPage: true, // Highlight the center slide
        viewportFraction: 1, // Width fraction for each slide
        autoPlayInterval: Duration(seconds: 3), // Slide interval
        autoPlayAnimationDuration: Duration(milliseconds: 800), // Animation duration
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
