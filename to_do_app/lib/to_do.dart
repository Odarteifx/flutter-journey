import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class MyToDoInterface extends StatefulWidget {
  const MyToDoInterface({super.key});

  @override
  State<MyToDoInterface> createState() => _MyToDoInterfaceState();
}

class _MyToDoInterfaceState extends State<MyToDoInterface> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
         BottomNavigationBarItem(icon: Icon(Iconsax.home), label: ''),
         BottomNavigationBarItem(icon: Icon(Iconsax.tick_circle), label: ''),
      ]),
      body:  SafeArea(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const CircleAvatar(
                    radius: 30,
                    child: Text('O'),
                  ),
                   const Text(
                    'Hi Odartei',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                  Container(
                    decoration: BoxDecoration(
                       color: Colors.amber,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}