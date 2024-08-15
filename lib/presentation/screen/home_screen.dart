import 'package:bakery/presentation/screen/about_screen.dart';
import 'package:bakery/presentation/screen/cart_screen.dart';
import 'package:bakery/presentation/screen/product_list_screen.dart';
import 'package:bakery/presentation/screen/wishlist_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    const ProductListScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const AboutScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: ""),
          ],
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 30,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blueGrey,
        ),
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        )
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [],
        // ),
        );
  }
}
