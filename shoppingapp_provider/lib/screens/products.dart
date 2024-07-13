import 'package:flutter/material.dart';
import 'package:shoppingapp_provider/models/data.dart';
import 'package:shoppingapp_provider/screens/carts.dart';
import 'package:shoppingapp_provider/widgets/producttile.dart';

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
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Producttile(
                    id: products[index].id,
                    name: products[index].name,
                    price: products[index].price,
                    color: products[index].color,
                  );
                },
                itemCount: products.length,
              ),
            )
          ],
        )));
  }
}
