import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/components/rounded_input_field.dart';
import 'package:admin/components/rounded_password_field.dart';
import 'package:admin/ui/colors.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  bool readOnly = false;

  final GlobalKey<FormState> _formKeyLogin = new GlobalKey<FormState>();

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
                      const Center(
                        child: SizedBox(
                          width: 328,
                          child: TextField(
                            // controller: usernameController ,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: 'Usuario',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: SizedBox(
                          width: 328,
                          child: TextField(
                            obscureText: true,
                            // controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: 'Senha',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('Esqueci minha senha',
                              style: TextStyle(color: kPrimaryDarkColor)),
                        ),
                      ),
                      const SizedBox(height: kMarginHalf),
                      CustomPrimaryButton(
                        onPressed: () {
                          // trySignin();
                          Get.toNamed('/home');
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
}
