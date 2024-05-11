import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(icon:
        const Icon(Icons.settings), 
        onPressed: () {
          
        },)
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           Container(
            alignment: Alignment.bottomRight,
            child: 
              Padding(
               padding: EdgeInsets.only(right: 30),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text(
                    '300',
                    style: TextStyle(
                      fontSize: 50
                      ),
                    ),
                    IconButton(
              icon: Icon(Icons.clear), 
              onPressed: () {
               
             },)
                    
                 ],
               ),
             ),
             
           ),
           const SizedBox(height: 50,),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton('C', Colors.black, () { }),
              calcButton('%', Colors.black, () { }),
              calcButton('÷', Colors.black, () { }),
              calcButton('x', Colors.black, () { }),
            ],
           ),
           const SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton('7', Colors.black, () { }),
              calcButton('8', Colors.black, () { }),
              calcButton('9', Colors.black, () { }),
              calcButton('-', Colors.black, () { }),
            ],
           ),
           const SizedBox(height: 10),
           Row( 
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton('4', Colors.black, () { }),
              calcButton('5', Colors.black, () { }),
              calcButton('6', Colors.black, () { }),
              calcButton('+', Colors.black, () { }),
            ],
           ),

           const SizedBox(height: 10),
           

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Column(
                
                 children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('1', Colors.black, () {  }),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                      calcButton('2', Colors.black, () { }),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                      calcButton('3', Colors.black, () { }),
                    ],
                   ),
                    const SizedBox( height: 10,),
                   Row(
                    children: [
                      calcButton('', Colors.black, () { }),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                      calcButton('0', Colors.black, () { }),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.06,),
                      calcButton('.', Colors.black, () { }),
                    ],
                   ),
                 ],            
               ),
               calcButton('=', Colors.amber, () { })
             ],
             
           )
          ],
        )
        ),
    );
  }
}


Widget calcButton(
    String buttonText, 
    Color buttonColor, 
    void Function()? buttonPressed
    ) {
  return Container(
    width: 75,
    height: buttonText == '=' ? 150 : 70,
    padding: const EdgeInsets.all(0),
    child: ElevatedButton(
      onPressed: buttonPressed,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(20))),
          backgroundColor: buttonColor),
      child: Text(buttonText,
        style: const TextStyle(fontSize: 27, color: Colors.white),
      ),
    ),
  );
}
