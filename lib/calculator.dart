import 'package:flutter/material.dart';
import 'package:flutter_application/circle_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // 눌러지는 버튼의 숫자를 위한 변수
  int? firstOperand;
  // 연산 기호를 위한 변수
  String? operator;
  // 연산을 하기 위한 두번째 숫자를 위한 변수
  int? secondOperand;
  // 결과를 담을 수 있는 변수
  dynamic result;

  void numberTapped(int tappedNumber) {
    if (firstOperand == null) {
      setState(() {
        firstOperand = tappedNumber;
      });
      return;
    }

    if (operator == null) {
      setState(() {
        firstOperand = int.parse("$firstOperand$tappedNumber");
      });
      return;
    }

    if (secondOperand == null) {
      setState(() {
        secondOperand = tappedNumber;
      });
      return;
    }

    setState(() {
      secondOperand = int.parse("$secondOperand$tappedNumber");
    });
  }

  void clearNumber() {
    setState(() {
      firstOperand = null;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  void operatorTapped(String tappedOperator) {
    setState(() {
      operator = tappedOperator;
    });
  }

  String showText() {
    if (result != null) {
      return "$result";
    }
    if (secondOperand != null) {
      return "$firstOperand$operator$secondOperand";
    }

    if (operator != null) {
      return "$firstOperand$operator";
    }

    if (firstOperand != null) {
      return "$firstOperand";
    }

    return "0";
  }

  void calculateResult() {
    if (firstOperand == null || secondOperand == null) {
      return;
    }

    if (operator == "+") {
      plusNumber();
      return;
    }

    if (operator == "-") {
      minusNumber();
      return;
    }

    if (operator == "X") {
      multiplyNumber();
      return;
    }

    if (operator == "/") {
      didveNumber();
      return;
    }
  }

  void plusNumber() {
    setState(() {
      result = firstOperand! + secondOperand!;
    });
  }

  void minusNumber() {
    setState(() {
      result = firstOperand! - secondOperand!;
    });
  }

  void multiplyNumber() {
    setState(() {
      result = firstOperand! * secondOperand!;
    });
  }

  void didveNumber() {
    setState(() {
      result = firstOperand! / secondOperand!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Align(
          alignment: Alignment.bottomRight,
          child: Text(showText(), style: const TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                CircleButton(padNumber: "7", onTap: () => numberTapped(7)),
                CircleButton(padNumber: "8", onTap: () => numberTapped(8)),
                CircleButton(padNumber: "9", onTap: () => numberTapped(9)),
                CircleButton(
                  padNumber: "/",
                  color: Colors.grey,
                  onTap: () => operatorTapped("/"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CircleButton(padNumber: "4", onTap: () => numberTapped(4)),
                CircleButton(padNumber: "5", onTap: () => numberTapped(5)),
                CircleButton(padNumber: "6", onTap: () => numberTapped(6)),
                CircleButton(
                  padNumber: "X",
                  color: Colors.grey,
                  onTap: () => operatorTapped("X"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CircleButton(padNumber: "1", onTap: () => numberTapped(1)),
                CircleButton(padNumber: "2", onTap: () => numberTapped(2)),
                CircleButton(padNumber: "3", onTap: () => numberTapped(3)),
                CircleButton(
                  padNumber: "-",
                  color: Colors.grey,
                  onTap: () => operatorTapped("-"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                CircleButton(
                  padNumber: "C",
                  onTap: clearNumber,
                  color: Colors.blueGrey,
                ),
                CircleButton(padNumber: "0", onTap: () => numberTapped(0)),
                CircleButton(
                  padNumber: "=",
                  onTap: calculateResult,
                  color: Colors.blueGrey,
                ),
                CircleButton(
                  padNumber: "+",
                  color: Colors.grey,
                  onTap: () => operatorTapped("+"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
