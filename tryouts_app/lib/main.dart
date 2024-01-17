import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      title: 'Tryouts',
      debugShowCheckedModeBanner: false,
      home: const MyAppInterface(),
    );
  }
}

class MyAppInterface extends StatefulWidget {
  const MyAppInterface({super.key});

  @override
  State<MyAppInterface> createState() => _MyAppInterfaceState();
}
List _friends = ['Zack','Aminu', 'Edmund', 'Richard', 'Owusu', 'Sarah', 'Dark', 'Romeo'];
class _MyAppInterfaceState extends State<MyAppInterface> {
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          title: const Text('WhatsApp',),
          actions: [
            IconButton(onPressed:() {
              
            }, 
            icon: const Icon(Icons.search)
            ),
            IconButton(onPressed:() {
              
            },
             icon: const Icon(Icons.more_vert)
             )
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            indicatorColor: Colors.white,
            tabs: [
            Tab(icon: Icon(Icons.camera_alt_rounded)),
            Tab(child: Text('CHATS')),
            Tab(child: Text('STATUS')),
            Tab(child: Text('CALLS')),
          ]),
        ),

        body: TabBarView(children: [
          //Camera tab
         const Card(
           child: Center( 
            child: Text('Camera')
           ),
         ),

         //Chats tab
         ListView.builder(itemBuilder:(context, index) {
           return Column(
             children: [
               ListTile(
                leading: CircleAvatar(
                   radius:30,
                  backgroundColor: Colors.teal[100 * index],
                  child: Text('${_friends[index][0]}'),
                ),  
                title: Text('${_friends[index]}'), 
                subtitle: Text('Hi William, My name is ${_friends[index]}'),
                onTap: () {         
                },
               ),
               const Divider(),
             ],
           );  
         },
         itemCount: _friends.length,
         ),       

         //STATUS tab
         const Card(
           child: Center(
            child: Text(
              'WhatsApp Status'
              )
            ),
         ),

          //CALLS tab
          const Card(
            child: Center(
              child: Text(
                'Video and Audio Calls'
                )
              ),
          ),


        ])
      ),
    );
  }
}