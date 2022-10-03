import 'package:flutter/material.dart';
import 'package:nepali_calculator/constants.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:nepali_calculator/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/animated_button.dart';
import 'components/helper_functions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = "";
  String equation = "0";
  String result = "0";
  late Size size;

  void fireButton(String btnKey) {
    setState(() {
      if (btnKey == "क्लिएर") {
        equation = "0";
        result = "0";
      } else if (btnKey == "⌫") {
        if (equation.length == 1) {
          equation = '0';
          return;
        }

        equation = equation.substring(0, equation.length - 1);
      } else if (btnKey == '0' && equation.length == 1) {
        equation = '०';
      } else if (btnKey == "=") {
        equation = nepaliToEnglish(equation);
        try {
          Parser p = Parser();
          Expression exp = p.parse(equation);
          ContextModel cm = ContextModel();
          String re = exp.evaluate(EvaluationType.REAL, cm).toString();
          expression = englishToNepali(expression);
          result = englishToNepali(re);
          if (result == "Infinity") {
            result = "∞";
          }
        } catch (e) {
          result = "त्रुटी..!";
        }
      } else {
        if (equation == '0') {
          equation = btnKey;
        } else {
          equation += btnKey;
        }
      }
    });
  }

  final _isSelected = [true, false];
  // late dynamic _isSelected;
  late int _selectedIndex = 0;
  late final btnHeight = size.height * 0.10;
  // late Color backgroundColor;
  late Color textColor;
  // bool _isDark = false;

  Future<void> putMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<CalculatorTheme>(context);
    size = MediaQuery.of(context).size;

    // backgroundColor = theme.isDark ? kBackgroundColor : Colors.white;
    textColor = theme.isDark ? Colors.white : Colors.black;
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              // SizedBox(height: 30.0),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 60.0,
                width: 150.0,
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(30.0),
                  isSelected: _isSelected,
                  onPressed: (index) {
                    _selectedIndex = index;
                    setState(() {
                      if (index == 0) {
                        _isSelected[0] = true;
                        _isSelected[1] = false;
                        theme.switchMode(false);
                        putMode(false);
                      } else if (index == 1) {
                        _isSelected[0] = false;
                        _isSelected[1] = true;
                        theme.switchMode(true);
                        putMode(true);
                      }
                    });
                  },
                  fillColor: kPrimaryColor.withOpacity(0.8),
                  color: Colors.grey,
                  selectedColor:
                      _selectedIndex == 0 ? Colors.yellow : Colors.white,
                  children: const [
                    Icon(Icons.light_mode),
                    Icon(Icons.dark_mode),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.15,
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                width: double.infinity,
                child: Text(
                  (equation.length == 1 && equation[0] == '0')
                      ? '0'
                      : englishToNepali(equation),
                  textAlign: TextAlign.right,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: textColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),

              Container(
                height: size.height * 0.13,
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                width: double.infinity,
                // TODO: Fitted box may be...
                child: Text(
                  result,
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: textColor,
                      ),
                ),
              ),

              const Divider(color: Colors.grey),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  // height: size.height * 0.6,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Table(
                        children: [
                          TableRow(
                            children: [
                              buildButton('क्लिएर', isFunctionKey: true),
                              buildButton('⌫', isFunctionKey: true),
                              buildButton('%', isFunctionKey: true),
                              buildButton('÷', isFunctionKey: true),
                            ],
                          ),
                          TableRow(
                            children: [
                              buildButton('७'),
                              buildButton('८'),
                              buildButton('९'),
                              buildButton('x', isFunctionKey: true),
                            ],
                          ),
                          TableRow(
                            children: [
                              buildButton('४'),
                              buildButton('५'),
                              buildButton('६'),
                              buildButton('-', isFunctionKey: true),
                            ],
                          ),
                          TableRow(
                            children: [
                              buildButton('१'),
                              buildButton('२'),
                              buildButton('३'),
                              buildButton('+', isFunctionKey: true),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Table(
                              children: [
                                TableRow(
                                  children: [
                                    buildButton('0'),
                                    buildButton('.'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: buildButton(
                              '=',
                              btnColor: kPrimaryColor,
                              isEqualKey: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedButton buildButton(
    String btnKey, {
    Color? btnColor,
    isFunctionKey = false,
    isEqualKey = false,
  }) {
    final btnKeyStyle =
        Theme.of(context).textTheme.button!.copyWith(fontSize: 24.0);
    return AnimatedButton(
      btnKey: btnKey,
      height: size.height * 0.08,
      onPressed: () => fireButton(btnKey),
      btnColor: btnColor ?? Theme.of(context).backgroundColor,
      keyStyle: isEqualKey
          ? btnKeyStyle.copyWith(color: Colors.white, fontSize: 30.0)
          : (!isFunctionKey
              ? btnKeyStyle
              : (btnKeyStyle.copyWith(
                  color: kPrimaryColor,
                  fontSize: 24.0,
                ))),
    );
  }
}
