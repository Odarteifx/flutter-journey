import 'package:demo/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _resetcontrolller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _resetcontrolller.dispose();
    super.dispose();
  }

  resetpassword() async {
    if (email.isNotEmpty) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Password Reset Email has been sent!',
          style: TextStyle(fontSize: 15),
        )));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            'No User found for that Email',
            style: TextStyle(fontSize: 15),
          )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            '${e.message}',
            style: const TextStyle(fontSize: 15),
          )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Recovery'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Form(
              key: _formkey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your Email';
                  }
                  return null;
                },
                controller: _resetcontrolller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  prefixIcon: HeroIcon(HeroIcons.user),
                  filled: true,
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      email = _resetcontrolller.text.trim();
                    }
                    resetpassword();
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 15.w),
                      shape:
                          const ContinuousRectangleBorder(side: BorderSide()),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.amber),
                  child: const Text('Send Email')),
            ),
            SizedBox(
              height: 20.h,
            ),
            Wrap(
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ));
                    },
                    child: Text(
                      'Create',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
