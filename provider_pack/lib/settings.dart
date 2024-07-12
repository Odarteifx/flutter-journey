import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pack/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

late TextEditingController _controller;

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('UserName: ${context.watch<UserProvider>().userName}')),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserProvider>().changeUserName(newUserName: _controller.text);
                _controller.clear();
              }, 
              child: const Text('Save'),
              )
          ],
        ));
  }
}
