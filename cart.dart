import 'package:e_com/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = (Provider.of<CartProvider>(context).Cart);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "MY CART",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: ((context, index) {
              final Cart = cart[index];
              return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  tileColor: Color.fromARGB(255, 246, 238, 238),
                  leading: CircleAvatar(
                    radius: 50,
                    child: Image(
                      image: AssetImage(
                        Cart['imageURL'] as String,
                      ),
                    ),
                  ),
                  title: Text(
                    Cart['title'] as String,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text("size: ${Cart['sizes']}"),
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: Text(
                                  "Delete product",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                content: Text(
                                  "are you sure you want to delete the product?",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "NO",
                                        style: TextStyle(color: Colors.blue),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Provider.of<CartProvider>(context,
                                                listen: false)
                                            .removeProduct(Cart);
                                            Navigator.of(context).pop();
                                      },
                                      
                                      child: Text("YES"))
                                ],
                              );
                            }));
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )));
            })));
  }
}
