import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage'),),
      body: Column(
        children: [
          const Center(
            child: Card(
              child: SizedBox(
                width: 100,
                height: 200,
              
              ),
            ),
           
          ),
          ElevatedButton(
            onPressed:() {
              Navigator.pop(context);
            }, 
            child: const Text('data')
            ),
        ],
      ),
      
    );
  }
}