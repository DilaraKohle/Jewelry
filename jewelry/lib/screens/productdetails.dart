import 'package:jewelry/screens/home.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productDescription;

  const ProductDetails({super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text('Ürün Detayları'),
        // backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Home()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(productImage, height: 200, width: 180),
              const SizedBox(height: 20),
              Text(
                productName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '\$$productPrice',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130.0),
                child: Text(
                  productDescription,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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