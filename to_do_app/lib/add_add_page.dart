import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Taskaddpage extends StatefulWidget {
  const Taskaddpage({super.key});

  @override
  State<Taskaddpage> createState() => _TaskaddpageState();
}

class _TaskaddpageState extends State<Taskaddpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          
              body:  SingleChildScrollView(
                 child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Text(
                          'Add A New Task',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                           const SizedBox(height: 20,),
                            Text(
                            'Task',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            )
                            ),
                           const TextField(
                            decoration: InputDecoration(
                            hintText: 'Enter Your Task',
                            border: OutlineInputBorder(
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          'Date',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            )
                          ),
                          DatePickerDialog(
                            firstDate: DateTime.now(), 
                            lastDate: DateTime(2100),
                            )
                      ],
                    ),
                  ),
                 ),
               ),
             );
  }
}