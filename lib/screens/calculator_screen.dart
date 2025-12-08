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
 
    ".",
    "=",
  ];
  final _globalKey = GlobalKey<FormState>();  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}