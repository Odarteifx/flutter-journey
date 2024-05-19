import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MyToDoInterface extends StatefulWidget {
  const MyToDoInterface({super.key});

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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
        child: NavigationBar(
          destinations: const [
           NavigationDestination(icon: Icon(Iconsax.home_2), label: ''),
          NavigationDestination(icon: Icon(Iconsax.calendar_1), label: ''),
          NavigationDestination(icon: Icon(Iconsax.chart_1), label: ''),
          NavigationDestination(icon: Icon(Iconsax.user), label: ''),
        ]),
      ),

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
                       const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: Text(
                          'O',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                      ),
                        Text(
                        'Hi Odartei',
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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: const Center(
          child: Icon(
            Iconsax.add_square,
            color: Colors.white,
            ),
        ),
        onPressed: (){

        }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
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
              fontSize: isSelected? 18 : 15,
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
                      fontWeight: FontWeight.bold,
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
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                      )
                      ),
                ),
                
                 Text(
                  taskStatus? 'Completed' : 'Not Completed',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: taskStatus? const Color(0xFF219653) : const Color.fromRGBO(235, 87, 87, 1),
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