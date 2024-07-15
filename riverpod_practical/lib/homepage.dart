import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practical/riverpod.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Demo'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(riverpodEasyLevel).toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(riverpodEasyLevel.notifier).state++;
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  ref.read(riverpodEasyLevel.notifier).state--;
                },
                icon: const Icon(Icons.remove),
                label: const Text('Remove'))
          ],
        ),
      ),
    );
  }
}
