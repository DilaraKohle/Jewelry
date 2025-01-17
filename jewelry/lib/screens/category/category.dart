import 'package:flutter/material.dart';
import 'package:jewelry/screens/shopping_basket.dart';
import '../bottomnav.dart';
import '../enum.dart';

class Category extends StatelessWidget {
  const Category({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryButton(
            text: "Kolyeler",
            image: "images/kolyeKategori.png",
            onPressed: () {
              navigateToProductList(context, "Kolyeler");
            },
          ),
          const SizedBox(width: 20),
          CategoryButton(
            text: "Bileklikler",
            image: "images/bileklikKategori.png",
            onPressed: () {
              navigateToProductList(context, "Bileklikler");
            },
          ),
          const SizedBox(width: 20),
          CategoryButton(
            text: "Küpeler",
            image: "images/kupeKategori.png",
            onPressed: () {
              navigateToProductList(context, "Küpeler");
            },
          ),
          const SizedBox(width: 20),
          CategoryButton(
            text: "Yüzükler",
            image: "images/yuzukKategori.png",
            onPressed: () {
              navigateToProductList(context, "Yüzükler");
            },
          ),
        ],
      ),
    );
  }

  void navigateToProductList(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductListScreen(category: category)),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onPressed;

  const CategoryButton({
    required this.image,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 70,
                height: 70,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final String category;

  const ProductListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    List<Product> productList = getProductListForCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text("$category "),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: productList.map((product) {
          return ProductItem(product: product);
        }).toList(),
      ),
      bottomNavigationBar: BottomNav(
        selectedMenu: MenuState.home,
      ),
    );
  }

  List<Product> getProductListForCategory(String category) {
    switch (category) {
      case "Kolyeler":
        return [
          Product(name: "Kolye 1", price: 1000, image: "images/kolyeurun1.png"),
          Product(name: "Kolye 2", price: 1500, image: "images/kolyeurun2.png"),
          Product(name: "Kolye 3", price: 1200, image: "images/kolyeurun3.png"),
          Product(name: "Kolye 4", price: 1100, image: "images/kolyeurun4.png"),
          Product(name: "Kolye 4", price: 1100, image: "images/kolyeurun4.png"),
          Product(name: "Kolye 4", price: 1100, image: "images/kolyeurun4.png"),
          Product(name: "Kolye 4", price: 1100, image: "images/kolyeurun4.png"),
        ];
      case "Bileklikler":
        return [
          Product(name: "Bileklik 1", price: 800, image: "images/bileklikurun1.png"),
          Product(name: "Bileklik 2", price: 900, image: "images/bileklikurun2.png"),
          Product(name: "Bileklik 3", price: 750, image: "images/bileklikurun3.png"),
          Product(name: "Bileklik 4", price: 750, image: "images/bileklikurun4.png"),
          Product(name: "Bileklik 4", price: 750, image: "images/bileklikurun4.png"),
          Product(name: "Bileklik 4", price: 750, image: "images/bileklikurun4.png"),
          Product(name: "Bileklik 4", price: 750, image: "images/bileklikurun4.png"),
        ];
      case "Küpeler":
        return [
          Product(name: "Küpe 1", price: 300, image: "images/kupeurun1.png"),
          Product(name: "Küpe 2", price: 350, image: "images/kupeurun2.png"),
          Product(name: "Küpe 3", price: 400, image: "images/kupeurun3.png"),
          Product(name: "Küpe 4", price: 500, image: "images/kupeurun4.png"),
          Product(name: "Küpe 4", price: 500, image: "images/kupeurun4.png"),
          Product(name: "Küpe 4", price: 500, image: "images/kupeurun4.png"),
          Product(name: "Küpe 4", price: 500, image: "images/kupeurun4.png"),
        ];
      case "Yüzükler":
        return [
          Product(name: "Yüzük 1", price: 500, image: "images/yuzukurun1.png"),
          Product(name: "Yüzük 2", price: 550, image: "images/yuzukurun2.png"),
          Product(name: "Yüzük 3", price: 600, image: "images/yuzukurun3.png"),
          Product(name: "Yüzük 4", price: 600, image: "images/yuzukurun4.png"),
          Product(name: "Yüzük 4", price: 600, image: "images/yuzukurun4.png"),
          Product(name: "Yüzük 4", price: 600, image: "images/yuzukurun4.png"),
          Product(name: "Yüzük 4", price: 600, image: "images/yuzukurun4.png"),
        ];
      default:
        return [];
    }
  }
}

class Product {
  final String name;
  final double price;
  final String image;

  Product({required this.name, required this.price, required this.image});
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoppingBasket()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ShoppingBasket()),
                          );
                        },
                        child: Text("Sepete Ekle"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}