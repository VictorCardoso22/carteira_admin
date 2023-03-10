import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastAviso(String aviso, Color color, BuildContext context) {
debugPrint("${color.toHex()}");
  Fluttertoast.showToast(
      msg: aviso,
      webPosition: "center",
      webBgColor: "linear-gradient(to right, ${color.toHex()}, ${color.toHex()})",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      //'${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

AlertDialog buildAlertDialog(
    {String? titulo, String? aceitar, String? cancelar, String? text, VoidCallback? onPressedConfirma, BuildContext? context}) {
  Widget cancelaButton;
  Widget publicaButton;
  cancelaButton = TextButton(
    child: Text(cancelar!),
    onPressed: () {
      Navigator.of(context!).pop();
    },
  );
  publicaButton = TextButton(
      child: Text(aceitar!),
      onPressed: onPressedConfirma
  );

  AlertDialog alert = AlertDialog(
    title: Text(titulo!),
    content: Text(text!),
    actions: [
      cancelaButton,
      publicaButton,
    ],
  );
  return alert;
}