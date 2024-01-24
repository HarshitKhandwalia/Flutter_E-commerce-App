import 'package:e_com/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'homepage.dart';

void main() {
  runApp(const E_Com());
}

class E_Com extends StatelessWidget {
  const E_Com({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          fontFamily: 'tiro',
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16
            ),
            prefixIconColor: Colors.grey,
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            titleMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold  
            )
          ),
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(0, 6, 6, 6),
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black
            )
          )
        ),
        home:HomePage()
        // home:  Enhanced_detail(
        //   product: product_details[0],
        // ),
      ),
    );
  }
}
