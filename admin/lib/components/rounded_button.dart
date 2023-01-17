import 'package:flutter/material.dart';

import '../ui/colors.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color color, textColor;
  const RoundedButton({
    key,
    this.text,
    this.onPressed,
    this.color = kPrimaryLightColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: textColor,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            textStyle: Theme.of(context).textTheme.button,
          ),
          child: Text(text!)),
    );
  }
}
