import 'package:flutter/material.dart';
import 'package:jewelry/screens/bottomnav.dart';
import 'package:jewelry/screens/constants.dart';
import 'package:jewelry/screens/category/category.dart';
import 'package:jewelry/screens/product/recent_product.dart';
import 'package:jewelry/screens/slider/slider.dart';
import 'package:jewelry/screens/enum.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const Column(
                    children: [
                      Text(
                        ' Jewelry Place',
                        style: TextStyle(
                          fontFamily: 'Serif',
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 3.0,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: kPrimaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //Search
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 4,
                                  ),
                                ]
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 14),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 4,
                                  ),
                                ]),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.sort_by_alpha),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const ProductSlider(),
              const SizedBox(
                height: 30,
              ),
              const Category(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(height: 200, child: RecentProduct()),
            ],
          ),
        ),
      ),
      drawer: const Drawer(),

       bottomNavigationBar: const BottomNav(
         selectedMenu: MenuState.home,
     )
    );
  }
}