import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';


class Taskaddpage extends StatefulWidget {
  const Taskaddpage({super.key});

  @override
  State<Taskaddpage> createState() => _TaskaddpageState();
}

class _TaskaddpageState extends State<Taskaddpage> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
              content: Container(
                height: 500,
                width: 700,
                decoration: const BoxDecoration(),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add a new task',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      const SizedBox( height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                            ),
                            ),
                            const SizedBox(height: 5,),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your task',
                              border: OutlineInputBorder(),
                            ),
                          )
                        ],
                      ),
                      const SizedBox( height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                            ),
                            ),
                            const SizedBox(height: 5,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Select date',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed:() {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                    );
                                },
                                 icon: const Icon(
                                  Iconsax.calendar_1,
                                  color: Colors.black,
                                  )
                                 )
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          taskButton(
                            'Save',
                            () {
                              print('Saved');
                            },
                            Colors.green
                             ),
                             taskButton(
                        'Cancel',
                        () {
                          return Navigator.pop(context);
                        },
                        Colors.red
                         ),
                        ],
                      ),
                  ],
                ),
              ),
             );
  }
}

Widget taskButton(String action, VoidCallback actionButton, Color btnColor){
  return MaterialButton(
    minWidth: 140,
    onPressed: actionButton,
    color: btnColor,
    child: Text(action),
  );
}