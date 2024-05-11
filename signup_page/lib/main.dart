import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
enum PopupJunction {whale, dog, cat, seafish}
class _MyHomePageState extends State<MyHomePage> {
  bool ischecked = false;
  bool _bookMark = false; 
  int? _value = 1;
  PopupJunction? selectedItem = PopupJunction.whale;
  DateTime? setDate = DateTime.now();
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    _bookMark = true;
    ischecked = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text('Welcome Back! 👋🏾',
        style: TextStyle(
          fontSize: 30,
          fontWeight:FontWeight.w500,
        ),
        ),
      ),
      body: Column(
            children: [
              const SizedBox(height: 50,),
              const FlutterLogo(size: 90,),
              const SizedBox(height: 50,),
              const Center(
                child: SizedBox(
                  width: 400,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        hintText: 'John',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Center(
                child: SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                        suffixIcon: IconButton(
                          onPressed:() {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                           icon: Icon( passwordVisible? Icons.visibility : Icons.visibility_off),
                          )
                      ),
                    ),
                  ),   
                ),
              ),

             const SizedBox(height: 0,),
              
             ElevatedButton(
              
              onPressed: () {
             
             },
              child: const Text('Submit')),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (index) {
                    return ChoiceChip(
                      label: Text('Item $index'),
                      selectedColor:Colors.amber[200], 
                      selected: _value == index,
                      onSelected: (value) {
                        if (_value != null) {
                          setState(() {
                            _value = index;
                           
                          });
                        }
                      },
                      );
                  })
                ),
              ),
              ActionChip(
                avatar: Icon(_bookMark ? Icons.bookmark_border : Icons.bookmark ),
                label: const  Text('Bookmark'),
                onPressed: () {
                  setState(() {
                    _bookMark = !_bookMark;
                    if (_bookMark){
                     print('Removed content from Bookmark');
                    }else
                    {
                      print('Content Bookmarked');
                    }
                  });
                },
                ),
                

            ],         
          )
    );
  }
}