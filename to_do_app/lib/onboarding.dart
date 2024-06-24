import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  const Spacer(),
                  
                   Column(
                     children: [
                      Text(
                        'STAY ORGANIZED', 
                     style: GoogleFonts.poppins(
                      shadows: [
                        const Shadow(
                          color: Color(0x3E000000),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        )
                      ],
                    fontSize: 35, 
                    fontWeight: FontWeight.w800,
                    ),
                    ),
                    Text(
                    'Manage your tasks easily and effectively', 
                    style: GoogleFonts.poppins(
                      fontSize: 17, 
                      fontWeight: FontWeight.w300
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
                       child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                          const Spacer(),
                           Text(
                            'Get Started', 
                           style: GoogleFonts.poppins(
                            fontSize: 22, 
                            fontWeight: FontWeight.w700, 
                            color: Colors.black
                            ),
                            ),
                           const Spacer(),
                           Text(
                            '>', 
                            style: GoogleFonts.poppins(
                              fontSize: 21, 
                              fontWeight: FontWeight.w700, 
                              color: Colors.black
                              ),
                              ),
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