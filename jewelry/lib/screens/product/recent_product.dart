import 'package:flutter/material.dart';
import 'package:jewelry/screens/constants.dart';
import 'package:jewelry/screens/productdetails.dart';

class RecentProduct extends StatelessWidget {
  final List<Map<String, dynamic>> productList = [
    {
      "name": "Kolye 1",
      "image": "images/kolyeurun1.png",
      "price": 1000,
    },
    {
      "name": "Bileklik 1",
      "image": "images/bileklikurun1.png",
      "price": 800,
    },
    {
      "name": "Küpe 1",
      "image": "images/kupeurun1.png",
      "price": 300,
    },
    {
      "name": "Yüzük 1",
      "image": "images/yuzukurun1.png",
      "price": 500,
    },
  ];

  RecentProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (BuildContext context, int index) {
        return RecentSingleProducts(
          product: productList[index],
        );
      },
    );
  }
}

class RecentSingleProducts extends StatefulWidget {
  final Map<String, dynamic> product;

  const RecentSingleProducts({
    super.key,
    required this.product,
  });

  @override
  State<RecentSingleProducts> createState() => _RecentSingleProductsState();
}

class _RecentSingleProductsState extends State<RecentSingleProducts> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(widget.product["image"]),
        ),
        ListTile(
          title: Text(widget.product["name"]),
          subtitle: Text('\$${widget.product["price"]}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                    color: isLiked ? Colors.red : Colors.black38,
                    size: 15,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        productImage: widget.product["image"],
                        productName: widget.product["name"],
                        productPrice: widget.product["price"],
                        productDescription: "Ürün detayları",
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'İncele',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}