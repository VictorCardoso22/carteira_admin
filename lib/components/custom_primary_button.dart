import 'package:flutter/material.dart';

import '../ui/colors.dart';

enum CustomPrimaryButtonType { fill, none, outline }

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton(
      {key,
      required String titulo,
      required VoidCallback onPressed,
      required CustomPrimaryButtonType type,
      bool small = false})
      : _titulo = titulo,
        _onPressed = onPressed,
        _type = type,
        _small = small,
        super(key: key);

  final String _titulo;
  final VoidCallback _onPressed;
  final CustomPrimaryButtonType _type;
  final bool _small;

  static const _config = {
    CustomPrimaryButtonType.fill: {
      "backgroundColor": MaterialStatePropertyAll(kPrimaryLightColor),
      "textStyle": TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kBackgroundLightColor),
      "border": null,
      "sizeHeight": 53,
      "elevation": MaterialStatePropertyAll(4.0),
    },
    CustomPrimaryButtonType.none: {
      "backgroundColor": MaterialStatePropertyAll(Colors.transparent),
      "textStyle":
          TextStyle(fontWeight: FontWeight.w600, color: kPrimaryLightColor),
      "border": null,
      "sizeHeight": 34,
      "elevation": MaterialStatePropertyAll(0.0),
    },
    CustomPrimaryButtonType.outline: {
      "backgroundColor": MaterialStatePropertyAll(kBackgroundLightColor),
      "textStyle": TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: kPrimaryLightColor),
      "border": BorderSide(width: 2, color: kPrimaryLightColor),
      "sizeHeight": 53,
      "elevation": MaterialStatePropertyAll(4.0),
    },
  };

  get backgroundColor => _config[_type]!['backgroundColor'];
  get textStyle => _config[_type]!['textStyle'];
  get border => _config[_type]!['border'];
  get sizeHeight => _config[_type]!['sizeHeight'];
  get elevation => _config[_type]!['elevation'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _small == false ? 328 : 153,
      height: sizeHeight,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: backgroundColor,
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  4), // Define o raio da borda arredondada
              side: border ??
                  const BorderSide(
                      width: 0,
                      color: Colors
                          .transparent), // Define a cor e largura da borda
            ),
          ),
          elevation: elevation,
        ),
        onPressed: _onPressed,
        child: Center(
          child: Text(
            _titulo,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
