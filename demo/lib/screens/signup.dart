import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController1 = TextEditingController();
  bool _hidePassword = false;
  bool _hidePassword1 = false;
  bool _pressed = false;
  bool _agreed = false;

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
              height: 20.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                TextField(
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
                
                TextField(
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
                
                TextField(
                  obscureText: _hidePassword,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Password',
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
                SizedBox(
                  height: 20.h,
                ),
                
                TextField(
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

                          Future.delayed(const Duration(milliseconds: 400), () {
                            setState(() {
                              _pressed = !_pressed;
                            });
                          });
                        },
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
            SizedBox(
                  height: 20.h,
                ),
            Row(
              children: [
                Checkbox(value: _agreed, onChanged: (value) {
                  setState(() {
                    _agreed = !_agreed;
                  });
                },),
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
                            
                              fontSize: 14.sp,
                              color: Colors.amber,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
