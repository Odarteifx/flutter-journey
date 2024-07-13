import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pack/provider.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}


class _CalculateState extends State<Calculate> {
  
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(context.watch<CounterProvider>().num.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().numIncrement();
                }, 
                child: const Icon(Icons.add)
                ),
                const SizedBox(width: 20,),
                ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().numDecrement();
                }, 
                child: const Icon(Icons.remove)
                )
            ],
          )
        ],
      ),
    );
  }
}