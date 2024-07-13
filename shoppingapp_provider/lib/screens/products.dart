import 'package:flutter/material.dart';
import 'package:shoppingapp_provider/screens/carts.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const MyCart();
                  },
                ));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
    );
  }
}
