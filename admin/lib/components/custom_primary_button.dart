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
      "backgroundColor": kPrimaryLightColor,
      "textStyle": TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kOnPrimaryLightColor),
      "border": null,
      "sizeHeight": 53,
    },
    CustomPrimaryButtonType.none: {
      "backgroundColor": Colors.transparent,
      "textStyle":
          TextStyle(fontWeight: FontWeight.w600, color: kPrimaryLightColor),
      "border": null,
      "sizeHeight": 34,
    },
    CustomPrimaryButtonType.outline: {
      "backgroundColor": Colors.transparent,
      "textStyle": TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: kPrimaryLightColor),
      "border": Border.fromBorderSide(
        BorderSide(width: 1, color: kPrimaryLightColor),
      ),
      "sizeHeight": 53,
    },
  };

  get backgroundColor => _config[_type]!['backgroundColor'];
  get textStyle => _config[_type]!['textStyle'];
  get border => _config[_type]!['border'];
  get sizeHeight => _config[_type]!['sizeHeight'];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: border,
        ),
        width: _small == false ? 328 : 153,
        height: sizeHeight,
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
