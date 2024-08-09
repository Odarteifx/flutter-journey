import 'package:demo/screens/signup.dart';
import 'package:demo/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    width: screenWidth,
                    child: Image.asset(
                      'assets/Onboarding-cuate.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '</Vision',
                            style: GoogleFonts.oswald(
                              color: Colors.amber,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05)),
                        TextSpan(
                            text: 'Duck>',
                            style: GoogleFonts.oswald(fontSize: screenWidth * 0.05))
                      ])),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        'Everything you need is in one place',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: screenWidth * 0.07),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer volutpat bibendum condimentum. Vivamus egestas lacus vel nibh aliquam.',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.045),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: pressed
                                    ? const Offset(0, 0)
                                    : const Offset(4, 4),
                                spreadRadius: 1,
                                blurRadius: 0)
                          ]),
                          child: TextButton(
                              onPressed: () {
                                setState(() {
                                  pressed = !pressed;
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 400), () {
                                  setState(() {
                                    pressed = false;
                                  });
                                });
                               Future.delayed(const Duration(seconds: 1), (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage(),));
                               });
                              },
                              onHover: (value) {
                                TextButton.styleFrom(
                                    backgroundColor: Colors.black12);
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04,
                                    vertical: screenHeight * 0.02),
                                shape: const ContinuousRectangleBorder(
                                    side: BorderSide(color: Colors.black)),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              Future.delayed(const Duration(seconds: 1), (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage(),));
                              } );
                            },
                            style: TextButton.styleFrom(
                              // backgroundColor: Colors.amberAccent,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: screenHeight * 0.02),
                              shape: const ContinuousRectangleBorder(
                                  side: BorderSide(color: Colors.black)),
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                              ),
                            )),
                      ),
                    ],
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
