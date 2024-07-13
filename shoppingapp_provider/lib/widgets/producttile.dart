import 'package:flutter/material.dart';
import 'package:shoppingapp_provider/models/data.dart';

class Producttile extends StatefulWidget {
  const Producttile({
    super.key,
    required this.id,
    required this.name,
    required this.color,
    required this.price,
  });
  final int id;
  final String name;
  final double price;
  final Color color;

  @override
  State<Producttile> createState() => _ProducttileState();
}

class _ProducttileState extends State<Producttile> {
  bool checker = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.onInverseSurface,
      leading: Container(
        height: 30,
        width: 30,
        color: widget.color,
      ),
      title: Text(
        widget.name,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text('\$${widget.price.toString()}'),
      trailing: Checkbox(
          value: checker,
          onChanged: (value) {
            setState(() {
              checker = value!;
            });
          }),
    );
  }
}
