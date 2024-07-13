import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp_provider/provider/cart_provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Consumer<CartProvider>(builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height *0.80,
              child: ListView.builder(
                itemCount: provider.cartItems.length,
                itemBuilder: (context, index) {
                return ListTile(
                  tileColor: Theme.of(context).colorScheme.onInverseSurface,
                  leading: Text(
                    provider.cartItems[index].name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  trailing: Text(
                    '\$${provider.cartItems[index].price.toString()}',
                    style: TextStyle(
                      fontSize: 15
                    ),
                    ),
                );
              },),
            )
          ],
        );
      },)
    );
  }
}