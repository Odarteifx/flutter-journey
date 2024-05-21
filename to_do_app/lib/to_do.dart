import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_app/add_add_page.dart';
import 'package:to_do_app/register.dart';


class MyToDoInterface extends StatefulWidget {
  const MyToDoInterface({super.key, required this.firstName, required this.lastName, required this.userName });

final String firstName;
final String lastName;
final String userName;

  @override
  
  State<MyToDoInterface> createState() => _MyToDoInterfaceState();
}


class _MyToDoInterfaceState extends State<MyToDoInterface> {
  String selectedDate = 'All';

  void buttonPressed(String day){
  setState(() {
    selectedDate = day;
  });
}
 int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      body:  SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 15,),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.lime[200],
                        child: const Text(
                          'O',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                      ),
                        Text(
                        'Hi, ${userNameController.text}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0xFF4F4F4F),
                          )
                          
                        ),
                       
                        width: 60,
                        height: 60,
                         child: const Center(
                           child:  Badge(
                            child: Icon(
                              Iconsax.notification
                              )
                              ),
                         ),
                       )
                    ],
                  ),
                ),
            
                const SizedBox(height: 26,),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Tasks',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                          
                      Text(
                        'See All',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFFC5C5C5),
                        ),
                      )
                    ],
                  ),
                ),
            
                const SizedBox(height: 26),
            
                 SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 15,),
                      taskScrollBtns('All', buttonPressed , selectedDate),
                      taskScrollBtns('Today', buttonPressed, selectedDate),
                      taskScrollBtns('16th May', buttonPressed, selectedDate),
                      taskScrollBtns('17th May', buttonPressed, selectedDate),
                      taskScrollBtns('18th May', buttonPressed, selectedDate),
                    ],
                  ),
                ),
                const SizedBox(height: 22,),
            
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                  children: [
                    taskSection('Develop A flutter project with flutter',const Color(0xFFFFF6E3), true),
                    taskSection('Design Ui For A Movie Application',const Color(0xFFE4E2DC), false),
                    taskSection('Zoom Meeting With Supervisor',const Color(0xFFD0D0B6), false),
                     taskSection('Develop A flutter project',const Color(0xFFFFD7C7), false),
                  ],
                 ),
               )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed:() {
         Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) {
               return const Taskaddpage();
            },
            )
         );
        }, 
        icon: const Icon(
          Iconsax.add_square,
          color: Colors.white,
          ),
        label: const Text(
          'Add Task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}


Widget taskScrollBtns(
  String day, void Function(String) buttonPressed, String selectedDate
){
  bool isSelected = day == selectedDate;
  return Padding(
    padding: const EdgeInsets.only(right: 15),
    child: GestureDetector(
      onTap: () => buttonPressed(day),
      child: Container(
        width: day == 'All'? 50 : 110,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected? Colors.black : const Color(0xFFEEEEEE),
        ),
        child: Center(
          child: Text(
            day,
            style:  GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: isSelected? 16 : 15,
              color: isSelected? Colors.white : null,
            ),
            )
            ),
      ),
    ),
  );
}

Widget taskSection(String task, Color taskColor, bool taskStatus,){
  return Padding(
    padding: const EdgeInsets.only(bottom: 11),
    child: Container( 
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: taskColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    task,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Iconsax.arrow_right_1,
                      color: Colors.white,
                      ),
                  ),
              ],
            ),
    
           const SizedBox( height: 24,),
    
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF4F4F4F),
                    ),
                    borderRadius: BorderRadius.circular(50),
                    
                  ),
                  child:  Center(
                    child: Text(
                      '15th May',
                      style: GoogleFonts.poppins(
                        color:  const Color(0xFF4F4F4F),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      )
                      ),
                ),
                
                 Text(
                  taskStatus? 'Completed' : 'Not Completed',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: taskStatus? const Color(0xFF219653) : const Color(0xFFEB5757),
                  ),
                  )
              ],
              
            )
        ]
        ),
      ),
      ),
  );

}