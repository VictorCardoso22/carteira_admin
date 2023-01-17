import 'package:admin/pages/admin_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/login_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Carteira de estudante',
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/home': (_) => AdminPage(),
      },
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: kPrimaryLightColor,

        colorScheme: const ColorScheme.light(
          primary: kPrimaryLightColor,
        ),

        // Define the default font family.
        fontFamily: 'Roboto Condensed',
      ),
    );
  }
}
