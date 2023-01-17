import 'package:flutter/material.dart';

import '../ui/colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton(
      {key,
      required String titulo,
      required VoidCallback onPressed,
      bool small = false})
      : _titulo = titulo,
        _onPressed = onPressed,
        _small = small,
        super(key: key);

  final String _titulo;
  final VoidCallback _onPressed;

  final bool _small;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: Text(_titulo),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        fixedSize: _small == false ? const Size(328, 53) : Size(153, 53),
        primary: kPrimaryLightColor,
        onPrimary: kOnPrimaryLightColor,
      ),
    );
  }
}
