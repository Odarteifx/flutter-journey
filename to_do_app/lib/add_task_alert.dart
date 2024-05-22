import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';


class Taskaddpage extends StatefulWidget {

  const Taskaddpage({super.key});

  

  @override
  State<Taskaddpage> createState() => _TaskaddpageState();
}

class _TaskaddpageState extends State<Taskaddpage> {

final taskController = TextEditingController();
final dateController = TextEditingController();
DateTime? selectedDate;
Color colorSelected = Colors.white;
bool taskStatus = false;


  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
              content: Container(
                height: 500,
                width: 700,
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Add a new task',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
                            controller: taskController,
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
                            controller: dateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Select date',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed:() {
                                  _selectDate(context);
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
                      const SizedBox(height: 10,),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Color',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            ),
                            const SizedBox(height: 5,),
                            GestureDetector(
                              onTap: () {
                                 _pickColor(context);
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: colorSelected,
                                  border: Border.all(
                                    color: Colors.grey
                                    ),
                                  borderRadius: BorderRadius.circular(4)
                                ),
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
                              if (taskController.text.isNotEmpty && selectedDate != null){
                                Navigator.pop(
                                  context,
                                  [taskController.text, selectedDate, colorSelected, taskStatus]
                                  );
                              } else {
                               
                              }
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

   void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

void _pickColor(BuildContext context) async {
  showDialog(
    context: context, 
  builder: (context) {
    return AlertDialog(
      title: const Text(
        'Pick a color',
        ),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: colorSelected, 
          onColorChanged: (Color color){
            setState(() {
              colorSelected = color;
            });
          }
          ),
      ),
      actions: [
        ElevatedButton(
           child:const Text('Select'),
           onPressed: (){
            Navigator.pop(context);
           },
           )
      ],
    );
  },
  );
}
}





Widget taskButton(String action, VoidCallback actionButton, Color btnColor){
  return MaterialButton(
    height: 40,
    minWidth: 140,
    onPressed: actionButton,
    color: btnColor,
    child: Text(
      action,
      style: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
  );
}



 


