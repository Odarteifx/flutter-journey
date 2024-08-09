import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/Onboarding-cuate.png',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text.rich(TextSpan(children: [
                    TextSpan(
                        text: '</Vision',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    TextSpan(text: 'Duck>', style: TextStyle(fontSize: 20))
                  ])),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Everything you need is in one place',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer volutpat bibendum condimentum. Vivamus egestas lacus vel nibh aliquam.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          height: 50,
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
                                fontSize: 16, color: Colors.grey[800]),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          'Register',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[800]),
                        )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
