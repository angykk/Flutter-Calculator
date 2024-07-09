import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Calculator());
}
class Button extends StatelessWidget {
  final String number;
  final Color buttonColor;
  final VoidCallback onPressed;

  Button({required this.number, required this.buttonColor, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height:75,
        width:75,
         child: FloatingActionButton(
          onPressed:onPressed,
          backgroundColor: buttonColor,
          child: 
              Text(
                number,
                style: TextStyle(
                    color: Color.fromARGB(255, 214, 255, 183),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ), 
          ),
        ),
      );
  }
}
class Calculator extends StatefulWidget {
  Calculator({super.key});

  @override
  State<StatefulWidget> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  String input = '';
  String operator = '';
  double prev = 0;
  String sPrev = '';
  String textString = '';

  double result = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 43, 58),
        body: 
            Column(
              children: [
               Expanded(
              child: Container(
                margin: EdgeInsetsDirectional.only(top:20, start:10, end:10,),
                color: Color.fromARGB(255, 2, 43, 58),
                padding: EdgeInsets.all(25),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      textString,
                      style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 214, 255, 183),
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  ),
                 ),
                ),
                
           
            Expanded(
              flex:3,
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                   padding: EdgeInsets.symmetric(vertical:5, horizontal:2,),
                    
                    children: [
                      Button(
                        number: "C",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => clearPressed(),
              
                      ),
                      Button(
                        number: "+/-",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => operatorPressed("+/-"),
                      ),
                      Button(
                        number: "%",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => operatorPressed("%"),
              
                      ),
                      Button(
                        number: "÷",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => operatorPressed("÷"),
                      ),
                      Button(
                        number: "7",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("7"),
                      ),
                      Button(
                        number: "8",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("8"),
                      ),
                      Button(
                        number: "9",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("9"),
                      ),
                      Button(
                        number: "x",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => operatorPressed("x"),
                      ),
                      Button(
                        number: "4",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("4"),
                      ),
                      Button(
                        number: "5",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("5"),
                      ),
                      Button(
                        number: "6",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("6"),
                      ),
                      Button(
                        number: "-",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => operatorPressed("-"),
                      ),
                      Button(
                        number: "1",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("1"),
                      ),
                      Button(
                        number: "2",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("2"),
                      ),
                      Button(
                        number: "3",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("3"),
                      ),
                      Button(
                        number: "+",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => operatorPressed("+"),
                      ),
                      Button(
                        number: "C",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => clearPressed(),
                      ),
                      Button(
                        number: "0",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("0"),
                      ),
                      Button(
                        number: ".",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => buttonPressed("."),
                      ),
                      Button(
                        number: "=",
                        buttonColor: Color.fromARGB(255,31, 122, 140),
                        onPressed: () => calculatePressed(),
                      ),
                    ],
                      
                ),
            ),
          ],
        ),
        ),
        
      );
      
  }
  void buttonPressed(String number){
    setState(() {
      textString += number;
      if(operator == ''){
        sPrev += number;
      }
      else{
        input += number;
      }
    }); 
  }

  void operatorPressed(String symbol){
    setState(() {
      operator = symbol;
      if(symbol == '+/-'){
        if(textString[0] == '-'){
          textString = textString.replaceFirst(RegExp(r'-'),'');
        }
        else{
          textString = '-$textString';
        }
        sPrev = '-$sPrev';
        return;
      }
      else if(symbol == '%'){
        prev = double.parse(sPrev);
        prev /= 100.0;
        sPrev = prev.toString();
        textString = prev.toString();
        return;
      }
      textString += symbol;
      
    }); 
  }

  void clearPressed(){
    setState(() {
      prev = 0;
      sPrev = '';
      textString = '';
      input = '';
      operator = '';
      result = 0;
    });
  }

  void calculatePressed(){

    setState(() {
       switch (operator) {
          case '÷':
            prev = double.parse(sPrev);
            double next = double.parse(input);
            result = prev/next;
            int res;
            if(result%1 == 0){
              res = result.round();
              textString = res.toString();
              prev = result;
              break;
            }
            textString = result.toString();
            prev = result;

          case 'x':
            prev = double.parse(sPrev);
            double next = double.parse(input);
            result = prev*next;
            int res;
            if(result%1 == 0){
              res = result.round();
              textString = res.toString();
              prev = result;
              break;
            }
            textString = result.toString();
            prev = result;

          case '-':
            prev = double.parse(sPrev);
            double next = double.parse(input);
            result = prev-next;
            int res;
            if(result%1 == 0){
              res = result.round();
              textString = res.toString();
              prev = result;
              break;
            }
            textString = result.toString();
            prev = result;


          case '+':
            prev = double.parse(sPrev);
            double next = double.parse(input);
            result = prev+next;
            int res;
            if(result%1 == 0){
              res = result.round();
              textString = res.toString();
              prev = result;
              break;
            }
            textString = result.toString();
            prev = result;

            break;
        }
        sPrev = prev.toString();
        input = '';
        operator = '';
        input = '';
    });
  
    
  }
}
  