import 'dart:convert';
import 'dart:html';

import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/components/rounded_input_field.dart';
import 'package:admin/components/rounded_password_field.dart';
import 'package:admin/model/user.dart';
import 'package:admin/pages/admin_page.dart';
import 'package:admin/pages/home_page/home_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../ui/dimens.dart';
import '../../common_codes.dart';

/// Tela de login
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: UniqueKey());

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }

}

/// State da tela de login
class LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    initializeDefault();
    window.localStorage.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do what you want here
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: kBackgroundLightColor,
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // Brasão
              Center(
                child: SizedBox(
                  width: 400,
                  child: Image.asset(
                    'assets/e-cart.png',
                  ),
                ),
              ),

              const SizedBox(height: kMarginDefault),

              Card(
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: kMarginDefault,
                    horizontal: kMarginDefault,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 300.0,
                    maxWidth: 380.0,
                    maxHeight: 400,
                  ),
                  child: Form(
                    child: AutofillGroup(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 22),
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryLightColor),
                          ),
                          const SizedBox(height: 26),
                          RoundedInputField(
                            labelText: 'Email',
                            controller: usernameController,
                          ),
                          const SizedBox(height: 18),
                          RoundedPasswordField(
                            controller: passwordController,
                            onEditingComplete: trySignin,
                          ),
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: TextButton(
                          //     onPressed: () {},
                          //     child: const Text('Esqueci minha senha',
                          //         style: TextStyle(color: kPrimaryDarkColor)),
                          //   ),
                          // ),
                         const SizedBox(height: kMarginHalf),
                          isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomPrimaryButton(
                                  onPressed: () {
                                    trySignin();
                                  },
                                  titulo: 'Entrar',
                                  type: CustomPrimaryButtonType.fill,
                                ),
                          const SizedBox(height: 16),

                          // Center(
                          //   child: CustomPrimaryButton(
                          //     onPressed: () {},
                          //     titulo: 'Criar conta',
                          //     type: CustomPrimaryButtonType.none,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Wrap(
                runSpacing: 22,
                spacing: 22,
                children: [
                  SizedBox(
                    width: 150,
                    child: Image.asset(
                      'assets/logo.png',
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Image.asset(
                      'assets/6code.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  trySignin() async {
    TextInput.finishAutofillContext();
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usernameController.text.trimRight(),
              password: passwordController.text)
          .then((value) {

        // setPreferencesCredentials(widget.usernameController.text.trimRight(), widget.passwordController.text);

        getFirebaseData();
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        toastAviso("Usuário ou senha incorretos", Colors.red, context);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        toastAviso("Usuário ou senha incorretos", Colors.red, context);
        print('Wrong password provided for that user.');
      } else {
        toastAviso("Usuário ou senha incorretos", Colors.red, context);
      }
    }
  }

  Future<void> getFirebaseData() async {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // print('Document data: ${documentSnapshot.data()}');

        UserModel dataUser = UserModel.fromJson(documentSnapshot.data());

          if(dataUser.admin){

            //---------------------------Salva secao no browser---------------------//
            String encryptedString = encryptString(jsonEncode(dataUser.toJson())); // criptografa a sessao
            window.localStorage["sessao_array"] = encryptedString; // guarda no local storage
            //---------------------------Salva secao no browser---------------------//

            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AdminPage(), settings: RouteSettings(name: "/home")), (route) => false);

          }else{
            toastAviso("Usuário não possui permissão", Colors.red, context);
          }

        setState(() {
          isLoading = false;
        });

      }
    });
  }

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    print('Initialized default app $app');
  }
}
