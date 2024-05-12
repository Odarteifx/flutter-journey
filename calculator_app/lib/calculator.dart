import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


bool lightmode = true;
class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
   String equation = '0';
  String result = '0';
  String expression = '';

  buttonPressed(String buttonText){
  
  setState(() {
    if (buttonText == 'AC') {
      equation = '0';
      result = '0';
    } else if (buttonText == '+/-') {
      if (equation[0] != '-') {
        equation = '-$equation';
      } else {
        equation = equation.substring(1);
      }
    } else if ( buttonText == '='){
      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');
      expression = expression.replaceAll('%', '/100');

      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        double evalResult = exp.evaluate(EvaluationType.REAL, cm);

        if (evalResult % 1 == 0) {
          result = evalResult.toInt().toString();
        } else {
          result = evalResult.toStringAsFixed(3);
        }
      } catch (e) {
        Error;
      }
    } else {
      if (equation == '0') {
        equation = buttonText;
      } else {
        equation = equation + buttonText;
      }
    }
  });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightmode? Colors.black : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Switch(
                trackColor: MaterialStateColor.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.white60;
                  }
                  return const Color(0xFFD9D9D9);
                }),
                thumbIcon: MaterialStateProperty.resolveWith((states){
                  if (states.contains(MaterialState.selected)) {
                    return const Icon(Icons.light_mode);
                  }
                  return const Icon(Icons.dark_mode);
                }) ,
                value: lightmode, 
                onChanged:(value) {
                  setState(() {
                    lightmode = value;
                  });
                },
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.end,
                      children: [
                        Text(
                          equation,
                          style: TextStyle(
                            fontSize: 35, 
                            color: lightmode? Colors.white : null
                            )
                          ),
                      Text(
                        result, 
                        style: TextStyle(
                          fontWeight: FontWeight.w500, 
                          fontSize: 60, color: lightmode? Colors.white : null
                          ),
                          ),
                      ],
                    ),
                  ),
                ),
                
                 Column(
                   children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcButton(equation == '0' ? 'AC' : 'C', const Color(0xFF3F3F3F), () { buttonPressed('AC');}),
                        calcButton('+/-',const Color(0xFF3F3F3F), () {buttonPressed('+/-'); }),
                        calcButton('%', const Color(0xFF3F3F3F), () {buttonPressed('%'); }),
                        calcButton('÷', const Color(0xFFF6B24B), () {buttonPressed('÷'); }),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcButton('7', const Color(0xFF3F3F3F), () {buttonPressed('7'); }),
                        calcButton('8', const Color(0xFF3F3F3F), () {buttonPressed('8'); }),
                        calcButton('9', const Color(0xFF3F3F3F), () {buttonPressed('9'); }),
                        calcButton('×', const Color(0xFFF6B24B), () {buttonPressed('×'); }),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcButton('4', const Color(0xFF3F3F3F), () {buttonPressed('4'); }),
                        calcButton('5', const Color(0xFF3F3F3F), () { buttonPressed('5');}),
                        calcButton('6', const Color(0xFF3F3F3F), () { buttonPressed('6');}),
                        calcButton('-', const Color(0xFFF6B24B), () { buttonPressed('-');}),
                      ],
                    ),
                    const SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcButton('1', const Color(0xFF3F3F3F), () { buttonPressed('1');}),
                        calcButton('2', const Color(0xFF3F3F3F), () { buttonPressed('2'); }),
                        calcButton('3', const Color(0xFF3F3F3F), () { buttonPressed('3');}),
                        calcButton('+', const Color(0xFFF6B24B), () { buttonPressed('+');},),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        calcButton('0', const Color(0xFF3F3F3F), () { buttonPressed('0');}),
                        calcButton('.', const Color(0xFF3F3F3F), () { buttonPressed('.');}),
                        calcButton('=', const Color(0xFFF6B24B), () { buttonPressed('=');}),
                      ],
                    ),
                   ],
                 )
          
            ],
          ),
        ),
      ),
    );
  }
}
 
//Calculator Button Widget
 Widget calcButton(
  String buttonText, Color buttonColor, void Function()? buttonPressed
 ) {
  
   return  Container(
    width: buttonText == '='? 170 : 80,
    height: 80,
    padding: const EdgeInsets.all(0),
    child: ElevatedButton(onPressed: buttonPressed, 
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
    ),
       child: Container(
        alignment: buttonText == '='? Alignment.centerRight : null,
         child: Text(
          buttonText, 
          style: TextStyle(
            color: Colors.white,
            fontSize: buttonColor == const Color(0xFFF6B24B) ? 34 : 21,
            fontWeight:FontWeight.bold,
            ),),
       ),
    )
   );
   
 }