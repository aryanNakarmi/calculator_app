import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  double first = 0;
  double second = 0;
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

  void _onButtonPressed(String char) {
    setState(() {
      if (char == "C") {
        _controller.clear();
        first = 0;
        second = 0;
        operator = "";
      } else if (char == "<-") {
        if (_controller.text.isNotEmpty) {
          _controller.text = _controller.text.substring(
            0,
            _controller.text.length - 1,
          );
        }
      } else if (char == "+" ||
          char == "-" ||
          char == "*" ||
          char == "/" ||
          char == "%") {
        first = double.parse(_controller.text);
        operator = char;
        _controller.clear();
      } else if (char == "=") {
        second = double.parse(_controller.text);
        double result = 0;
        switch (operator) {
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
            result = second != 0 ? first / second : 0;
            break;
          case "%":
            result = first % second;
            break;
        }
        _controller.text = result.toString();
      } else {
        _controller.text += char;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(223, 0, 0, 0),
      appBar: AppBar(
        title: const Text(
          "Calculator App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),

              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.bottomRight,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomRight,
                    child: Text(
                      _controller.text.isEmpty ? '0' : _controller.text,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              Expanded(
                flex: 5,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    final char = characters[index];
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () => _onButtonPressed(char),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          char,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
