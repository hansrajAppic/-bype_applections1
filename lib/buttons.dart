import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key, // Marking key as nullable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
    child: Text(
      text,
      style: TextStyle(fontSize: 24),
    ),
    style: ElevatedButton.styleFrom(
      shape: StadiumBorder(), backgroundColor: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      textStyle: TextStyle(color: Colors.white),
    ),
    onPressed: onClicked,
  );
}
