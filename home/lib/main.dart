import 'package:flutter/material.dart';

void main() => runApp(const FTFLUTTER());


class FTFLUTTER extends StatelessWidget {
  const FTFLUTTER({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First Flutter'),
        ),
        body: const Center(
          child: Text('Hello World!'),
        ) ,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


