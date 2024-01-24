import 'package:e_com/Global_varible.dart';

import 'package:e_com/product_card.dart';
import 'package:e_com/productdetailslarge.dart';
import 'package:flutter/material.dart';


class Frontpage extends StatefulWidget {
  static const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 16, 16, 16),
      ),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));

  const Frontpage({super.key});

  @override
  State<Frontpage> createState() => _FrontpageState();
}

class _FrontpageState extends State<Frontpage> {
  final List<String> Filters = const [
    'All',
    'Adidas',
    'Nike',
    'Asics',
    'Prada',
    'Gucci'
  ];
  late String Selected;
  @override
  void initState() {
    super.initState();
    Selected = Filters[0];
  }

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Column(children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Shoes \ncollection",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: Frontpage.border,
                focusedBorder: Frontpage.border,
              ),
            ))
          ],
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Filters.length,
              itemBuilder: (context, index) {
                final filter = Filters[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Selected = filter;
                      });
                      print(Selected);
                    },
                    child: Chip(
                      backgroundColor: Selected == filter
                          ? Color.fromARGB(255, 249, 132, 123)
                          : const Color.fromARGB(255, 236, 233, 233),
                      label: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        child: Text(
                          Filters[index],
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: product_details.length,
              itemBuilder: ((context, index) {
                final product = product_details[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: ((context) {
                      return Enhanced_detail(product: product);
                    })));
                  },
                  child: ProductCard(
                    image: product['imageURL'] as String,
                    heading: product['title'] as String,
                    price: product['price'] as double,
                    backgroundcol: const Color.fromARGB(255, 162, 213, 255),
                  ),
                );
              })),
        ),
      ]),
    );
  }
}
