import 'package:flutter/material.dart';
import 'package:to_do_app/register.dart';

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
          child:  SafeArea(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Spacer(),
                  
                  const Column(
                     children: [
                      Text('STAY ORGANIZED', 
                     style: TextStyle(
                    fontSize: 32, 
                    fontWeight: FontWeight.bold,
                    ),
                    ),
                   Text(
                    'Manage your tasks easily and effectively', 
                    style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.w100
                      ),
                      ),
                     ],
                  ),
              
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style:  ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.transparent,
                        ),
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder:(context) => const RegPage(),)
                        );
                      },
                       child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          Spacer(),
                           Text('Get Started', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
                           Spacer(),
                           Text('>', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
                         ],
                       )
                       ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}