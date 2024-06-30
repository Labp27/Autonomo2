import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Lucia B.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _operation = '';
  double _num1 = 0.0;
  String _expression = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      _operation = '';
      _num1 = 0.0;
      _expression = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      _num1 = double.parse(_output);
      _operation = buttonText;
      _expression = '$_num1 $_operation';
      _output = '0';
    } else if (buttonText == '=') {
      double num2 = double.parse(_output);
      if (_operation == '+') {
        _output = (_num1 + num2).toString();
      } else if (_operation == '-') {
        _output = (_num1 - num2).toString();
      } else if (_operation == '×') {
        _output = (_num1 * num2).toString();
      } else if (_operation == '÷') {
        _output = (_num1 / num2).toString();
      }
      _num1 = 0.0;
      _operation = '';
      _expression = '';
    } else {
      if (_output == '0') {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
        onPressed: () => _buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(fontSize: 24.0, color: Colors.grey),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    _output,
                    style: TextStyle(fontSize: 48.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('÷'),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('×'),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('.'),
                    _buildButton('0'),
                    _buildButton('C'),
                    _buildButton('+'),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('='),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
