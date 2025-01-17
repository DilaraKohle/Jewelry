import 'package:jewelry/screens/enum.dart';
import 'package:flutter/material.dart';
import 'package:jewelry/screens/home.dart';
import 'package:jewelry/screens/shopping_basket.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const inactiveColor = Colors.grey;
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFADADADA),
            offset: Offset(0, -15),
            blurRadius: 30,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: MenuState.home == selectedMenu ? Colors.black : inactiveColor,
              ),
              onPressed: () {
                if (selectedMenu != MenuState.home) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: MenuState.shoppingbasket == selectedMenu ? Colors.black : inactiveColor,
              ),
              onPressed: () {
                if (selectedMenu != MenuState.shoppingbasket) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ShoppingBasket()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}