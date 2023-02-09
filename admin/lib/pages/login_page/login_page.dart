import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/components/rounded_input_field.dart';
import 'package:admin/components/rounded_password_field.dart';
import 'package:admin/ui/colors.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

import '../../../ui/dimens.dart';

/// Tela de login
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

/// State da tela de login
class LoginPageState extends State<LoginPage> {
  bool isLoading = false;


  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 120),

              // Brasão
              Center(
                child: SizedBox(
                  width: 250,
                  child: Image.asset(
                    'assets/logo.png',
                  ),
                ),
              ),

              const SizedBox(height: kMarginDefault),

              Card(
                margin: const EdgeInsets.all(kMarginDefault),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: kMarginDefault,
                    horizontal: kMarginDefault,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 300.0,
                    maxWidth: 368.0,
                    maxHeight: 420,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'CARTEIRA ESTUDANTIL',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: kMarginDefault),
                      const SizedBox(height: 20),
                      RoundedInputField(labelText: 'Email', controller: usernameController,),
                      const SizedBox(height: 16),
                      RoundedPasswordField(controller: passwordController,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Esqueci minha senha',
                              style: TextStyle(color: kPrimaryDarkColor)),
                        ),
                      ),
                      const SizedBox(height: kMarginHalf),
                      isLoading? const Center(child: CircularProgressIndicator(),) : CustomPrimaryButton(
                        onPressed: () {
                           trySignin();

                        },
                        titulo: 'Entrar',
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Criar conta',
                              style: TextStyle(color: kPrimaryLightColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  trySignin() async {
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
        Get.toNamed('/home');
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
      }
    }
  }

  toastAviso(String aviso, Color color, BuildContext context) {
    Toast.show(aviso,
        duration: 6,
        gravity: Toast.top,
        backgroundRadius: 80,
        backgroundColor: color);
  }
}
