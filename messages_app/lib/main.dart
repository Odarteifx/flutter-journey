import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppInterface(),
    );
  }
}

class MyAppInterface extends StatelessWidget {
  MyAppInterface({super.key});

  final List<String> users = ['Maxwell','William 🤩','Justice', 'Dark', 'George'];
  final List<String> messages = ['Hello', 'Bonjour!', 'How are you doing?', '🤣🤣', 'Well Done'];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.cyan[100 * (index % 9)],
              child: Text(users[index][0]),
            ),
            title: Text(users[index]),
            subtitle: Text(messages[index], style: const TextStyle(fontWeight: FontWeight.w200),),
            trailing: const Icon(Icons.navigate_next),

            onTap: () {
              print('${users[index]} has been tapped');
              print(index);
            },
          );
        },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            const TextField();
            print('add new message');
          },
           backgroundColor: Colors.green[200],
           child: const Icon(
            Icons.message_sharp,
            size: 30,
            ),
          ),
    );
  }
}

