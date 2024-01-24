import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class Enhanced_detail extends StatefulWidget {
  final Map<String, Object> product;
  const Enhanced_detail({super.key, re, required this.product});

  @override
  State<Enhanced_detail> createState() => _Enhanced_detailState();
}

int sel = 0;

class _Enhanced_detailState extends State<Enhanced_detail> {
  // @override
  // void initState() {
  //   super.initState();
  //   sel = 0;
  // }
  void onTap() {
    if(sel != 0){
      Provider.of<CartProvider>(context, listen: false).addProduct({
      'title': widget.product['title'],
      'price': widget.product['price'],
      'sizes': sel,
      'imageURL': widget.product['imageURL']
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product added sucessfully")));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Select a size")));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Image(image: AssetImage(widget.product['imageURL'] as String)),
            const Spacer(
              flex: 2,
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 232, 251, 242),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '\$${widget.product['price']}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              ((widget.product['sizes'] as List<int>).length),
                          itemBuilder: (context, index) {
                            final size =
                                (widget.product['sizes'] as List<int>)[index];
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    sel = size;
                                  });
                                },
                                child: Chip(
                                  label: Text(size.toString()),
                                  backgroundColor:
                                      sel == size ? Colors.red : Colors.white,
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: onTap,
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 251, 159, 153),
                        minimumSize: Size(double.infinity, 50),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
