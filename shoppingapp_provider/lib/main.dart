import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp_provider/provider/cart_provider.dart';
import 'package:shoppingapp_provider/screens/products.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
          useMaterial3: true,
        ),
        home: const ProductsPage(),
      ),
    );
  }
}
