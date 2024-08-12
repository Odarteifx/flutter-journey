import 'package:demo/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

String email = '', password = '', name = '', confirmpassword = '';

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  bool _hidePassword = true;
  bool _hidePassword1 = true;
  bool _pressed = false;
  bool _agreed = false;

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if ((password == confirmpassword) &&
        (password != null &&
            _usernameController != null &&
            _emailController != null &&
            _passwordController != null &&
            _passwordController1 != null)) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Regsitered Successfully',
          style: TextStyle(fontSize: 20),
        )));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AppHome(),
            ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Color(0xFFBFB8A5),
              content: Text(
                'Password Provided is too Weak',
                style: TextStyle(fontSize: 15),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                'Acount already exists',
                style: TextStyle(fontSize: 20),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: '</Vision',
                    style: GoogleFonts.oswald(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 20.sp,
                    )),
                TextSpan(
                    text: 'Duck>', style: GoogleFonts.oswald(fontSize: 20.sp))
              ])),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Register',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              'Enter your personal information',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(
              height: 30.h,
            ),
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Name';
                      }
                      return null;
                    },
                    controller: _usernameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Enter your Name',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Email Address',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Password';
                      }
                      return null;
                    },
                    obscureText: _hidePassword1,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword1 = !_hidePassword1;
                            });
                          },
                          icon: _hidePassword1
                              ? const HeroIcon(HeroIcons.eye)
                              : const HeroIcon(HeroIcons.eyeSlash),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Confirmation Password';
                      }
                      return null;
                    },
                    obscureText: _hidePassword1,
                    controller: _passwordController1,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Confirm Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword1 = !_hidePassword1;
                            });
                          },
                          icon: _hidePassword1
                              ? const HeroIcon(HeroIcons.eye)
                              : const HeroIcon(HeroIcons.eyeSlash),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _agreed,
                        onChanged: (value) {
                          setState(() {
                            _agreed = !_agreed;
                          });
                        },
                      ),
                      Flexible(
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            Text(
                              'I acknowledge that I have read and agree to ',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'VisionDuck Agreements',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.amber,
                                  fontSize: 14.sp,
                                  color: Colors.amber,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset:
                              _pressed ? const Offset(0, 0) : Offset(4.h, 4.w),
                          spreadRadius: 1,
                        )
                      ]),
                      child: TextButton(
                          onPressed: _agreed
                              ? () {
                                  setState(() {
                                    _pressed = !_pressed;
                                  });
                                  Future.delayed(
                                      const Duration(milliseconds: 400), () {
                                    setState(() {
                                      _pressed = !_pressed;
                                    });
                                  });

                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      name = _usernameController.text.trim();
                                      email = _emailController.text.trim();
                                      password = _passwordController.text.trim();
                                      confirmpassword =
                                          _passwordController1.text.trim();
                                    });
                                  }
                                  registration();
                                }
                              : null,
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.h, vertical: 15.w),
                              shape: const ContinuousRectangleBorder(
                                  side: BorderSide(color: Colors.black))),
                          child: Text(
                            'Continue',
                            style: TextStyle(fontSize: 16.sp),
                          )),
                    ),
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
