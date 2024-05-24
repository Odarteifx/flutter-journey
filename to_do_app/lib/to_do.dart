import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_app/add_task_alert.dart';


class MyToDoInterface extends StatefulWidget {
  const MyToDoInterface({super.key, required this.firstName, required this.lastName, required this.userName });

final String firstName;
final String lastName;
final String userName;

  @override
  
  State<MyToDoInterface> createState() => _MyToDoInterfaceState();
}



class _MyToDoInterfaceState extends State<MyToDoInterface> {
  List toDoList = [
  //['Develop A flutter project with flutter',DateTime(2024,02,02),const Color(0xFFFFF6E3), true],
  //['Design Ui For A Movie Application',DateTime(2024,02,02),const Color(0xFFE4E2DC), false],
  //['Zoom Meeting With Supervisor',DateTime(2024,02,02),const Color(0xFFD0D0B6), false],
  //['Develop A flutter project',DateTime(2024,02,02),const Color(0xFFFFD7C7), false],
];

  String selectedDate = 'All';
  

  void buttonPressed(String day){
  setState(() {
    selectedDate = day;
  });
}
 int currentPageIndex = 0;

void createNewTask()async{
  final newTask = await showDialog(
    context: context,
     builder: (context) {
       return const Taskaddpage();
     },
     );
     if (newTask != null){
      setState(() {
        toDoList.add(newTask);
      });
     }
}

 List<String> generateDates() {
    List<String> dateList = ['All'];
    DateTime today = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime date = today.add(Duration(days: i));
      String dateString = "${date.day} ${_getMonthName(date.month)}";
      dateList.add(dateString);
    }
    return dateList;
  }

  @override
  Widget build(BuildContext context) {
    var selectedSort = 0;

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
                        child: Text(
                          widget.userName.toString()[0],
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                      ),
                        Text(
                         'Hi, ${widget.userName}',
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

                     //Sort menu    
                     PopupMenuButton(
                      icon: const Icon(
                        Iconsax.sort,
                        ),
                      initialValue: selectedSort,
                      itemBuilder: (context) {
                        return [
                           PopupMenuItem(
                          child: Text(
                            'See all tasks',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                            ),
                          ),
                          PopupMenuItem(
                          child: Text(
                            'Completed',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                            ),
                          ),
                          PopupMenuItem(
                          child: Text(
                            'Not Completed',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                            ),
                          ),
                          ] ;
                      },
                      )
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
            
                  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 15,),
                      ...generateDates().map((date) {
                      return taskScrollBtns(date, buttonPressed, selectedDate);
                    }),
                    ]
                  ),
                ),
                
                const SizedBox(height: 22,),
            
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                  children: [
                  
                   toDoList.isEmpty? 
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                      const SizedBox(height: 200,),
                        Center
                       (child:  Text(
                        'No Task Available',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        ),
                       ),
                     ],
                   ) : 
                   ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return taskSection(
                        toDoList[index][0], 
                        toDoList[index][1],
                        toDoList[index][2],
                        toDoList[index][3],
                        );
                    },
                    itemCount: toDoList.length,
                    )
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
        onPressed: createNewTask, 
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
  String day, 
  void Function(String) buttonPressed, 
  String selectedDate
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

Widget taskSection(
  String task, 
  DateTime taskDate,
  Color taskColor, 
  bool taskStatus,
  ){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
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
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
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
                      '${taskDate.day} ${_getMonthName(taskDate.month)}',
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

String _getMonthName(int month){
  const monthNames = [
    'Jan', 'Feb','Mar','Apr', 'May',
    'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return monthNames[month - 1];
}