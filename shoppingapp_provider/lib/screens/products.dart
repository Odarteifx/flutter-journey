import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp_provider/models/data.dart';
import 'package:shoppingapp_provider/models/models.dart';
import 'package:shoppingapp_provider/provider/cart_provider.dart';
import 'package:shoppingapp_provider/screens/carts.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                Product product = products[index];
                CartProvider cartProvider = Provider.of<CartProvider>(context);
                return ListTile(
                  tileColor: Theme.of(context).colorScheme.onInverseSurface,
                  leading: Container(
                    height: 30,
                    width: 30,
                    color: product.color,
                  ),
                  title: Text(
                    product.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('\$${product.price.toString()}'),
                  trailing: Checkbox(
                      value: cartProvider.cartItems.contains(product),
                      onChanged: (value) {
                        if (value == true) {
                          cartProvider.addProduct(product);
                        } else {
                          cartProvider.removeProduct(product);
                        }
                      }),
                );
              },
              itemCount: products.length,
            )
          ],
        )));
  }
}
