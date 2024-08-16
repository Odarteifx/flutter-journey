import 'package:demo/screens/auth.dart';
import 'package:demo/screens/forgot_password.dart';
import 'package:demo/screens/home.dart';
import 'package:demo/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _hidePassword = true;
  bool _pressed = false;

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppHome(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Color(0xFFBFB8A5),
          content: Text(
            'Account does not Exist',
            style: TextStyle(fontSize: 15),
          ),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0xFFBFB8A5),
            content: Text(
              'Invalid Email',
              style: TextStyle(fontSize: 15),
            )));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Color(0xFFBFB8A5),
            content: Text(
              'Invalid Email',
              style: TextStyle(fontSize: 15),
            )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Error: ${e.message}',
            style: const TextStyle(fontSize: 15),
          ),
        ));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
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
              'Login',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              'Login to continue using the app',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(
              height: 15.h,
            ),
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 10.h,
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
                        hintText: 'Enter your Email',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Password';
                      }
                      return null;
                    },
                    obscureText: _hidePassword,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: 'Enter Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          icon: _hidePassword
                              ? const HeroIcon(HeroIcons.eye)
                              : const HeroIcon(HeroIcons.eyeSlash),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.grey),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ));
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
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
                          onPressed: () {
                            setState(() {
                              _pressed = !_pressed;
                            });
                            Future.delayed(const Duration(milliseconds: 400),
                                () {
                              setState(() {
                                _pressed = !_pressed;
                              });
                            });

                            if (_formkey.currentState!.validate()) {
                              email = _emailController.text.trim();
                              password = _passwordController.text.trim();
                            }
                            userLogin();
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.h, vertical: 15.w),
                              shape: const ContinuousRectangleBorder(
                                  side: BorderSide(color: Colors.black))),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 16.sp),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Or login via',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          height: 48.h,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.h, vertical: 8.w),
                                // side: const BorderSide(color: Color(0xFFD8D8D8)),
                              ),
                              onPressed: () {},
                              child: Image.asset('assets/facebook.png'))),
                      SizedBox(
                          height: 48.h,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.w, vertical: 10.h),
                                //  side: const BorderSide(color: Color(0xFFD8D8D8)),
                              ),
                              onPressed: () {
                                AuthMethods().signInWithGoogle(context);
                              },
                              child: Image.asset('assets/google.png'))),
                      SizedBox(
                          height: 48.h,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.h, vertical: 10.w),
                                //side: const BorderSide(color: Color(0xFFD8D8D8)),
                              ),
                              onPressed: () {},
                              child: Image.asset('assets/apple-logo.png'))),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Wrap(
                      children: [
                        Text(
                          'Don\'t have an accout? ',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        InkWell(
                          onTap: () {
                            Future.delayed(const Duration(milliseconds: 400),
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpPage(),
                                  ));
                            });
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.amber,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
