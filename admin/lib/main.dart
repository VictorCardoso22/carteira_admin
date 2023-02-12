import 'package:admin/firebase_options.dart';
import 'package:admin/pages/admin_page.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/carterias/carteiras_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'pages/login_page/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AdminPageViewlModel? adminPageViewlModel;
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Carteira de estudante',
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/home': (_) => AdminPage(),
        '/carteiras': (_) =>
            CarteirasPage(adminPageViewlModel: adminPageViewlModel!),
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
