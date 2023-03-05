// ignore_for_file: prefer_const_constructors

import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';

class DadosPessoaisPage extends StatefulWidget {
  TextEditingController textEditingControllerCpf = new TextEditingController();
  TextEditingController textEditingControllerNomeCompleto =
      new TextEditingController();
  TextEditingController textEditingControllerDataNascimento =
      new TextEditingController();
  TextEditingController textEditingControllerRg = new TextEditingController();
  TextEditingController textEditingControllerEmissor =
      new TextEditingController();
  TextEditingController textEditingControllerCep = new TextEditingController();
  TextEditingController textEditingControllerLogradouro =
      new TextEditingController();
  TextEditingController textEditingControllerBairro =
      new TextEditingController();
  TextEditingController textEditingControllerNumero =
      new TextEditingController();
  TextEditingController textEditingControllerComplemento =
      new TextEditingController();
  TextEditingController textEditingControllerEmail =
      new TextEditingController();
  TextEditingController textEditingControllerSenha =
      new TextEditingController();

  DadosPessoaisPage({Key? key}) : super(key: key);

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
            controller: widget.textEditingControllerCpf,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'CPF*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo CPF não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
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
            controller: widget.textEditingControllerDataNascimento,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
              flex: 4,
              // width: 282,
              child: TextFormField(
                controller: widget.textEditingControllerCep,
                keyboardType: TextInputType.number,
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
            SizedBox(width: 18),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: kPrimaryDarkColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: kPrimaryLightColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
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
                controller: widget.textEditingControllerNumero,
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
            controller: widget.textEditingControllerEmail,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'E-mail*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo e-mail não pode ser vazio!';
              }
              return text.contains('@') ? null : 'Informe um email valido';
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
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
