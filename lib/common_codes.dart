import 'dart:convert';
import 'dart:html';

import 'package:admin/model/user.dart';
import 'package:admin/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:encrypt/encrypt.dart' as sec;


toastAviso(String aviso, Color color, BuildContext context) {
  debugPrint(color.toHex());
  Fluttertoast.showToast(
      msg: aviso,
      webPosition: "center",
      webBgColor:
          "linear-gradient(to right, ${color.toHex()}, ${color.toHex()})",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
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

encryptString(String text) {
  final plainText = text;

  final key = sec.Key.fromLength(16);
  final iv = sec.IV.fromLength(16);
  final encrypter = sec.Encrypter(sec.AES(key));

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  // final decrypted = encrypter.decrypt(encrypted, iv: iv);

  return encrypted.base64;
}

decryptString(String text) {
  final key = sec.Key.fromLength(16);
  final iv = sec.IV.fromLength(16);
  final encrypter = sec.Encrypter(sec.AES(key));

  final decrypted = encrypter.decrypt64(text, iv: iv);

  return decrypted;
}

AlertDialog buildAlertDialog(
    {String? titulo,
    String? aceitar,
    String? cancelar,
    String? text,
    void Function()? onPressedConfirma,
    BuildContext? context}) {
  Widget cancelaButton;
  Widget publicaButton;
  cancelaButton = TextButton(
    child: Text(cancelar!),
    onPressed: () {
      Navigator.of(context!).pop();
    },
  );
  publicaButton =
      TextButton(onPressed: onPressedConfirma, child: Text(aceitar!));

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

UserModel? getDataUser(BuildContext context) {
  var jsonDecoded;
  UserModel? userModel;

  try {
    String jsonString = decryptString(window.localStorage["sessao_array"]!);
    jsonDecoded = jsonDecode(jsonString);
    userModel = UserModel.fromJson(jsonDecoded);
  } catch(e){
    debugPrint("aqui");// ta sem sessao
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage(), settings: RouteSettings(name: "/login")), (route) => false);
  }
  return userModel;
}
