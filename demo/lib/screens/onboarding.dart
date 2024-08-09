import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '</Vision',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: screenWidth * 0.05)),
                  TextSpan(text: 'Duck>', style: TextStyle(fontSize: screenWidth * 0.05))
                ])),
                //  SizedBox(
                //   height: screenHeight * 0.02,
                // ),
                Text(
                  'Everything you need is in one place',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: screenWidth * 0.07),
                ),
                // SizedBox(
                //   height: screenHeight * 0.01,
                // ),
                 Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer volutpat bibendum condimentum. Vivamus egestas lacus vel nibh aliquam.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.045),
                ),
                // SizedBox(
                //   height: screenHeight * 0.01,
                // ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    height: screenHeight * 0.06,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.amberAccent,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(4, 4),
                              spreadRadius: 1,
                              blurRadius: 0)
                        ]),
                    child: Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize:  screenWidth * 0.04, color: Colors.grey[800]),
                    )),
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    'Register',
                    style:
                        TextStyle(fontSize: screenWidth * 0.04, color: Colors.grey[800]),
                  )),
                ),
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
