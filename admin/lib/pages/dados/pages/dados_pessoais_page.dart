// ignore_for_file: prefer_const_constructors

import 'package:admin/common_codes.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DadosPessoaisPage extends StatefulWidget {
  bool isEnabled = true;
  TextEditingController textEditingControllerCpf = TextEditingController();
  TextEditingController textEditingControllerNomeCompleto =
      TextEditingController();
  TextEditingController textEditingControllerDataNascimento =
      TextEditingController();
  TextEditingController textEditingControllerRg = TextEditingController();
  TextEditingController textEditingControllerEmissor = TextEditingController();
  TextEditingController textEditingControllerCep = TextEditingController();
  TextEditingController textEditingControllerLogradouro =
      TextEditingController();
  TextEditingController textEditingControllerBairro = TextEditingController();
  TextEditingController textEditingControllerNumeroEndereco =
      TextEditingController();
  TextEditingController textEditingControllerComplemento =
      TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerSenha = TextEditingController();

  var maskFormatterCPF = new MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterCEP = new MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
  var maskFormatterDataNascimento = new MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  DadosPessoaisPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DadosPessoaisPage> createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // width: 328,
          child: TextFormField(
            enabled: widget.isEnabled,
            controller: widget.textEditingControllerCpf,
            keyboardType: TextInputType.number,
            inputFormatters: [widget.maskFormatterCPF],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'CPF*',
            ),
            validator: (text) {
              if (!CPFValidator.isValid(text)) {
                return 'Cpf inválido';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            enabled: widget.isEnabled,
            controller: widget.textEditingControllerNomeCompleto,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Nome completo*',
              // errorText: _errorText
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo nome completo não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            enabled: widget.isEnabled,
            controller: widget.textEditingControllerDataNascimento,
            inputFormatters: [widget.maskFormatterDataNascimento],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Data de nascimento*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo data de nascimento não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              flex: 3,
              // width: 296,
              child: TextFormField(
                enabled: widget.isEnabled,
                controller: widget.textEditingControllerRg,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'RG*',
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'O campo RG não pode ser vazio!';
                  }

                  return null;
                },
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              // width: 90,
              child: TextFormField(
                enabled: widget.isEnabled,
                controller: widget.textEditingControllerEmissor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Emissor*',
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'O campo Emissor não pode ser vazio!';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              flex: 4,
              // width: 282,
              child: TextFormField(
                enabled: widget.isEnabled,
                controller: widget.textEditingControllerCep,
                keyboardType: TextInputType.number,
                inputFormatters: [widget.maskFormatterCEP],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'CEP*',
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'O campo CEP não pode ser vazio!';
                  }

                  return null;
                },
              ),
            ),
            //SizedBox(width: 18),
            // Container(
            //   width: 52,
            //   height: 52,
            //   decoration: BoxDecoration(
            //     color: kPrimaryColor,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.search,
            //       color: kPrimaryLightColor,
            //     ),
            //   ),
            // ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            enabled: widget.isEnabled,
            controller: widget.textEditingControllerLogradouro,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Logradouro*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo logradouro não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              flex: 3,
              // width: 282,
              child: TextFormField(
                enabled: widget.isEnabled,
                controller: widget.textEditingControllerBairro,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Bairro*',
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'O campo bairro não pode ser vazio!';
                  }

                  return null;
                },
              ),
            ),
            SizedBox(width: 18),
            Expanded(
              // width: 38,
              child: TextFormField(
                enabled: widget.isEnabled,
                controller: widget.textEditingControllerNumeroEndereco,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelText: 'Nº*',
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'O campo nº não pode ser vazio!';
                  }

                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            enabled: widget.isEnabled,
            controller: widget.textEditingControllerComplemento,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Complemento',
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            enabled: widget.isEnabled,
            controller: widget.textEditingControllerEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'E-mail*',
            ),
            validator: (value) {
              var email = value;
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(email!);
              if (emailValid) {
                return null;
              } else {
                return "Verifique o email por favor";
              }
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            enabled: widget.isEnabled,
            controller: widget.textEditingControllerSenha,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Senha*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo senha não pode ser vazio!';
              }
              if (text.length < 6) {
                return 'A senha não pode ser menor que 6 caracteres!';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
