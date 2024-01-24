import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String heading;
  final double price;
  final Color backgroundcol;
  const ProductCard(
      {super.key,
      required this.image,
      required this.heading,
      required this.price,
      required this.backgroundcol});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundcol,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '\$$price',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Image(
                  image: AssetImage(image),
                  height: 175,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
