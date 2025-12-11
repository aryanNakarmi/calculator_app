import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  final TextEditingController _controller = TextEditingController();
  double first = 0;
  double second =0;
  String operator = "";
  final List<String> characters = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];
  final _globalKey = GlobalKey<FormState>();  

  void _onButtonPressed(String char){
    setState(() {
      if(char == "C"){
        _controller.clear();
        first= 0;
        second = 0;
        operator = "";
      }else if(char == "<-"){
        if(_controller.text.isNotEmpty){
          _controller.text = _controller.text.substring(0, _controller.text.length -1);
        }
      }else if(char == "+"||
       char == "-"|| 
       char == "*"|| 
       char == "/"|| 
       char == "%"){
        first = double.parse(_controller.text);
        operator = char;
        _controller.clear();
       }else if(char == "="){
        second = double.parse(_controller.text);
        double result = 0;
        switch(operator){
          case "+":
          result = first + second;
          break;
          case "-":
          result = first - second;
          break;
          case "*":
          result = first * second;
          break;
          case "/":
          result =  second!=0 ? first/second : 0;
          break;
          case "%":
          result = first % second;
          break;
        }
        _controller.text = result.toString();
      
       }else{
        _controller.text += char;
       }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}