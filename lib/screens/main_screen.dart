// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calculator_ui/data/items.dart';
import 'package:calculator_ui/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isOparations(String x) {
    if (x == '/' || x == 'X' || x == '-' || x == '+' || x == '=' || x == '%') {
      return true;
    }
    return false;
  }

  String que = "";
  String answer = "";

  void enterBtnValue(String x) {
    setState(() {
      que += x;
    });
  }

  void acBtnValue(String x) {
    setState(() {
      que = "";
      answer = "";
    });
  }

  void plusMinusBth() {
    setState(() {
      que += "-";
    });
  }

  void evaluationFunc() {
    String finalAns = que;
    finalAns = finalAns.replaceAll('X', '*');
    finalAns = finalAns.replaceAll('%', '/100');
    finalAns = finalAns.replaceAll('ANS', answer);
    try {
      Parser p = Parser();
      Expression exp = p.parse(finalAns);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        answer = eval.toString();
      });
    } catch (e) {
      setState(() {
        answer = "Error";
        que = "";
      });
    }
  }

  void deleteBtn() {
    setState(() {
      que = que.substring(0, que.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 25.0),
          child: DarkOrLightBtn(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        que,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: GridView.builder(
                    itemCount: btns.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return CalcBtn(
                          buttonText: btns[index],
                          color: Theme.of(context).colorScheme.secondary,
                          textColor: Theme.of(context).colorScheme.tertiary,
                          onTap: () => acBtnValue(btns[index]),
                        );
                      }
                      if (index == 16) {
                        return CalcBtn(
                          buttonText: btns[index],
                          color: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.tertiary,
                          onTap: () {
                            setState(() {
                              que = 'ANS';
                            });
                          },
                        );
                      }
                      if (index == btns.length - 1) {
                        return CalcBtn(
                          buttonText: btns[index],
                          color: Theme.of(context).colorScheme.onPrimary,
                          textColor: Theme.of(context).colorScheme.tertiary,
                          onTap: () => evaluationFunc(),
                        );
                      }
                      if (index == 1) {
                        return IconCalcBtn(
                          button: btns[index],
                          color: Theme.of(context).colorScheme.onSecondary,
                          textColor: Theme.of(context).colorScheme.tertiary,
                          onTap: () => deleteBtn(),
                        );
                      }
                      return CalcBtn(
                        buttonText: btns[index],
                        color: isOparations(btns[index])
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                        textColor: Theme.of(context).colorScheme.tertiary,
                        onTap: () => enterBtnValue(btns[index]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
