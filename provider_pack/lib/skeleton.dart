import 'package:flutter/material.dart';
import 'package:provider_pack/calculate.dart';
import 'package:provider_pack/homepage.dart';
import 'package:provider_pack/settings.dart';

class SkeletonView extends StatefulWidget {
  const SkeletonView({super.key});

  @override
  State<SkeletonView> createState() => _SkeletonViewState();
}

class _SkeletonViewState extends State<SkeletonView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            destinations: const <Widget>[
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.calculate), label: 'Math'),
              NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
            ]),
        body: <Widget>[
          const Homepage(),
          const Calculate(),
          const Settings(),
        ][selectedIndex]);
  }
}
