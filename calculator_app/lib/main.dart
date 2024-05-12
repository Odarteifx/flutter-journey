import 'package:flutter/material.dart';

import 'calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey,),
        useMaterial3: true,
      ),
      
      home: const CalculatorUI(),
    );
  }
}