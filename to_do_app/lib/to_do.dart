import 'package:flutter/material.dart';
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
      bottomNavigationBar: BottomNavigationBar(items: const [
         BottomNavigationBarItem(icon: Icon(Iconsax.home), label: ''),
         BottomNavigationBarItem(icon: Icon(Iconsax.tick_circle), label: ''),
      ]),
      body:  SafeArea(
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
                   const Text(
                    'Hi Odartei',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                       color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      
                      
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
        
           const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                      
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
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
          ],
        ),
      ),
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
          color: isSelected? Colors.black : const Color.fromRGBO(238, 238, 238, 1),
        ),
        child: Center(
          child: Text(
            day,
            style:  TextStyle(
              fontSize: 15,
              color: isSelected? Colors.white : null,
            ),
            )
            ),
      ),
    ),
  );
}

