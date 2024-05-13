import 'package:flutter/material.dart';

class OnboardingWid extends StatefulWidget {
  const OnboardingWid({super.key});

  @override
  State<OnboardingWid> createState() => _OnboardingWidState();
}

class _OnboardingWidState extends State<OnboardingWid> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(image:  AssetImage('assets/onboardingimg.jpg'),
            fit: BoxFit.cover,
            )
          ),
          child: const SafeArea(
            child:  Column(
              children: [
                Spacer(),
                Text('STAY ORGANIZED', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                Text('Manage your tasks easily and effectively', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),),
                Spacer(),
                
              ],
            ),
          ),
        ),
    );
  }
}