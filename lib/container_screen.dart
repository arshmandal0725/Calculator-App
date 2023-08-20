import 'package:calculator_app/list.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key, required this.theme});
  final void Function() theme;
  @override
  State<StatefulWidget> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  var input = "";
  var output = "";
  var operation = "";
  bool backGroundTheme = true;

  void onClicked(value) {
    setState(() {
      if (value == "AC") {
        input = "";
        output = "";
      } else if (value == "<") {
        input = input.substring(0, input.length - 1);
      } else if (value == "=") {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
      } else {
        input = input + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15, right: 5, left: 5),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: (backGroundTheme)
                                    ? const Color.fromARGB(82, 220, 220, 220)
                                    : const Color.fromARGB(255, 32, 32, 32)),
                            height: 35,
                            width: 90,
                            child: Row(children: [
                              Expanded(
                                child: IconButton(
                                    onPressed: (backGroundTheme)
                                        ? () {
                                            backGroundTheme = !backGroundTheme;
                                            widget.theme();
                                          }
                                        : null,
                                    icon: const Icon(Icons.light_mode)),
                              ),
                              Expanded(
                                child: IconButton(
                                    onPressed: (backGroundTheme)
                                        ? null
                                        : () {
                                            backGroundTheme = !backGroundTheme;
                                            widget.theme();
                                          },
                                    icon: const Icon(Icons.dark_mode)),
                              )
                            ]),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        input,
                        style: const TextStyle(
                            fontSize: 55, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        output,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: (backGroundTheme)
                          ? const Color.fromARGB(82, 220, 220, 220)
                          : const Color.fromARGB(255, 32, 32, 32)),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1.09,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 25),
                      itemCount: key.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {
                            onClicked(key[index].string);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (backGroundTheme)
                                    ? const Color.fromARGB(82, 234, 234, 234)
                                    : const Color.fromARGB(255, 38, 38, 38)),
                            child: Center(
                              child: (index == 1)
                                  ? Icon(
                                      Icons.cancel_presentation_outlined,
                                      color: key[index].color,
                                    )
                                  : Text(
                                      key[index].string,
                                      style: TextStyle(
                                          color: (index == 4 ||
                                                  index == 5 ||
                                                  index == 6 ||
                                                  index == 8 ||
                                                  index == 9 ||
                                                  index == 10 ||
                                                  index == 12 ||
                                                  index == 13 ||
                                                  index == 13 ||
                                                  index == 14 ||
                                                  index == 16 ||
                                                  index == 17 ||
                                                  index == 18)
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .onBackground
                                              : key[index].color,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          )),
    );
  }
}
