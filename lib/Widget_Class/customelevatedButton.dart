import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final double borderRadius;
  final double elevation;
  final TextStyle? textStyle;
  final Size minimumSize;

  const CustomElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color = Colors.blue,
    this.borderRadius = 8.0,
    this.elevation = 2.0,
    this.minimumSize = const Size(double.infinity, 50),
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        minimumSize: minimumSize,
      ),
      child: DefaultTextStyle.merge(
        style: textStyle ?? TextStyle(), // Use provided textStyle, or default
        child: child,
      ),
    );
  }
}
