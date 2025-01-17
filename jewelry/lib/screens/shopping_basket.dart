import 'package:jewelry/screens/bottomnav.dart';
import 'package:jewelry/screens/enum.dart';
import 'package:flutter/material.dart';
import 'package:jewelry/screens/home.dart';


class ShoppingBasket extends StatefulWidget {
  const ShoppingBasket({super.key});
  @override
  State<ShoppingBasket> createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
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
      body: const Center(

        child: Text(
          "Sepetim boş",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(
        selectedMenu: MenuState.shoppingbasket,
      ),
    );
  }
}