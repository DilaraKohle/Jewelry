import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 230.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio:
            16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction:
            1,
      ),
      items: [
        'images/kolyeSlider.png',
        'images/bileklikSlider.png',
        'images/kupeSlider.png',
        "images/yuzukSlider.png",
      ].map((String imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius:
                  BorderRadius.circular(50),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit
                      .cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}