import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/to_do.dart';

final _formkey = GlobalKey<FormState>(); 

class RegPage extends StatefulWidget {
  const RegPage({super.key});



  @override
  State<RegPage> createState() => _ToDoUIState();
}
final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _userNameController = TextEditingController();
   
class _ToDoUIState extends State<RegPage> {
   
  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child:  Column(
            children: [
             Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome!', 
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      const SizedBox( height: 2,),
                      Text(
                        "Let's get to know you",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                         fontSize: 20, 
                        ),
                        ),
                  ],
                ),
              ),
               const SizedBox(height: 60,),

              Form(
                key: _formkey ,
                child: Column(
                  children: [
                    Column(  
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [
                         Text(
                          'Firstname',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            hintText: 'William',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          
                        ),
                        const SizedBox(height: 20,),
                
                         Text(
                          'Lastname',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Lamptey',
                            hintStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                
                        Text(
                          'Username',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          controller: _userNameController,
                          decoration: InputDecoration(
                            hintText: 'Odartei',
                            hintStyle: const TextStyle(
                              color: Colors.grey
                              ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),         
              Container(
                
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)
                ),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.black,
                  ),
                  onPressed:() {
                    _formkey.currentState!.validate();
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return MyToDoInterface(
                        firstName: _firstNameController.text, 
                        lastName: _lastNameController.text, 
                        userName: _userNameController.text,
                        );
                  }
                  ));
                  }, 
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                       Text(
                        'Continue',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        ),
                       const Spacer(),
                       Text(
                        '>',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        ),
                    ],
                  ),
                  ),
              )

            ],
          ),
        ),
      ),
    );
  }
}