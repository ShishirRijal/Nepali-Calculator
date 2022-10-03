import 'package:flutter/material.dart';
import 'package:nepali_calculator/theme/theme.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    Key? key,
    required this.btnKey,
    required this.keyStyle,
    this.btnColor = kBackgroundColor,
    this.height = 80,
    this.width = 50,
    required this.onPressed,
  }) : super(key: key);
  final String btnKey;
  final TextStyle keyStyle;
  final Color btnColor;
  final double width;
  final double height;
  final VoidCallback onPressed;

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<CalculatorTheme>(context);
    return Listener(
      onPointerUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onPointerDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          margin: const EdgeInsets.all(10.0),
          // padding: const EdgeInsets.all(10.0),
          duration: const Duration(milliseconds: 100),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: _isPressed
                ? []
                : theme.isDark
                    ? kDarkShadow
                    : kLightShadow,
            color: widget.btnColor,
          ),
          height: widget.height,
          width: widget.width,
          child: Text(
            widget.btnKey,
            style: widget.keyStyle,
          ),
        ),
      ),
    );
  }
}
