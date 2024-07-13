import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp_provider/models/data.dart';
import 'package:shoppingapp_provider/provider/cart_provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart (${Provider.of<CartProvider>(context).cartItems.length})'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: Consumer<CartProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.cartItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onLongPress: () {
                          provider.cartItems.remove(products[index]);
                        },
                        tileColor:
                            Theme.of(context).colorScheme.onInverseSurface,
                        leading: Text(
                          provider.cartItems[index].name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '\$${provider.cartItems[index].price.toString()}',
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                        ),
                        ),
                      Text(
                        '\$${provider.getCartTotal().toString()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
