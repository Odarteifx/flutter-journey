import 'package:flutter/material.dart';
import 'package:to_do_app/to_do.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _ToDoUIState();
}

class _ToDoUIState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:  Column(
            children: [
             const Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome!', 
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox( height: 2,),
                      Text(
                        "Let's get to know you",
                        style: TextStyle(
                         fontSize: 15, 
                        ),
                        ),
                  ],
                ),
              ),
               const SizedBox(height: 60,),
              Column(
                children: [
                  Column(  
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      const Text(
                        'Firstname',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'William',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text(
                        'Lastname',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Lamptey',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Text(
                        'Username',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 5,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Odartei',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
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
                    Navigator.push(context, MaterialPageRoute(builder:(context) => const MyToDoInterface(),));
                  }, 
                  child: const Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                       Text(
                        'Continude',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        ),
                       Spacer(),
                       Text(
                        '>',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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