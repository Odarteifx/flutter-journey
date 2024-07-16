import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practical/riverpod.dart';

class HardPage extends ConsumerWidget {
  const HardPage({super.key});

  @override
  build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Demo 2'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(riverpodHardLevel).counter.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(riverpodHardLevel).counterAdd();
              },
              icon: const Icon(Icons.add),
              label: const Text('Add'),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  ref.read(riverpodHardLevel).counterRemove();
                },
                icon: const Icon(Icons.remove),
                label: const Text('Remove'))
          ],
        ),
      ),
    );
  }
}
