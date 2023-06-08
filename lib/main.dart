// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, annotate_overrides, unused_local_variable, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '00',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestion,
                   style: TextStyle( fontSize: 30),)),
                Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer, style: TextStyle(fontSize: 25))),
              ],
            ),
          )),
          Expanded(
            flex: 2,
            child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      //  Clear Button
                      if (index == 0) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userQuestion = '';
                                  userAnswer = '';

                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.black,
                          textColor: Colors.white,
                        );
                      }

                      // Delete Buttons
                      else if (index == 1) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userQuestion = userQuestion.substring(
                                  0, userQuestion.length - 1);
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                      // Equal Button
                      else if (index == buttons.length - 1) {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              equalPressed();
                            });
                          },
                          buttonText: buttons[index],
                          color: Colors.blue[900],
                          textColor: Colors.white,
                        );
                      }
                      //  Nuemeric and Operators
                      else {
                        return MyButton(
                          buttontapped: () {
                            setState(() {
                              userQuestion += buttons[index];
                            });
                          },
                          buttonText: buttons[index],
                          color: isOperator(buttons[index])
                              ? Colors.blue[900]
                              : Colors.blue[600],
                          textColor: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.black,
                        );
                      }
                    })),
          )
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '+' || x == '-' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String FinalString = userQuestion;
    Parser p = Parser();
    Expression exp = p.parse(userQuestion);
    ContextModel cm = ContextModel();

    double val =  exp.evaluate(EvaluationType.REAL,cm);

    userAnswer = val.toString();
  }
}
