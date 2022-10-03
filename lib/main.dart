import 'package:flutter/material.dart';
import 'package:nepali_calculator/theme/theme.dart';
import 'package:provider/provider.dart';

import 'screens/calculator/calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //
  // bool getMode() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final isDark = prefs.getBool('isDark') ?? false; // true for light mode
  //   return isDark;
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorTheme(),
      child: Builder(builder: (context) {
        final theme = Provider.of<CalculatorTheme>(context);

        // getMode().then((value) => theme.switchMode(value));

        return MaterialApp(
          theme: theme.theme,
          debugShowCheckedModeBanner: false,
          // darkTheme: ThemeData(
          //   brightness: Brightness.dark,
          // ),
          home: const Calculator(),
        );
      }),
    );
  }
}
