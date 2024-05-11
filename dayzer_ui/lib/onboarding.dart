import 'package:dayzer_ui/home.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/onboardingpage.JPG'),
            fit: BoxFit.cover,
          )
        ),
        child:  Column(
          children: [
            const Spacer(),
            const Text(
              'Dayzer.', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 35, 
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 3.0),
                    blurRadius: 3.0,
                    color: Colors.deepOrangeAccent,
                  )
                ]
                ),
                ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder:(context) {
                      return const MyAppInterface();
                    },));
                  },
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8)
                      ),
                      child: const Center(
                        child: Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                          )
                        ),
                  ),
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}