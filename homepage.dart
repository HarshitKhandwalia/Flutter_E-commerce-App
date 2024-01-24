
import 'package:e_com/cart.dart';
import 'package:e_com/frontpage.dart';

import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current_page = 0;
  final List<Widget> Pages_Scroll = [Frontpage(), MyCart()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Pages_Scroll[current_page],
        bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          onTap: (value) {
            setState(() {
              current_page = value;
            });
          },
          currentIndex: current_page,
          elevation: 0,
          items: [
            BottomNavigationBarItem(label: "", icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: " ")
          ],
        ));
  }
}
