// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InstituicaoPage extends StatefulWidget {
  InstituicaoPage({Key? key}) : super(key: key);

  TextEditingController textEditingControllerInstituicaoDeEnsino =
      new TextEditingController();
  TextEditingController textEditingControllerMatricula =
      new TextEditingController();
  TextEditingController textEditingControllerTurno =
      new TextEditingController();
  TextEditingController textEditingControllerCurso =
      new TextEditingController();

  @override
  State<InstituicaoPage> createState() => _InstituicaoPageState();
}

class _InstituicaoPageState extends State<InstituicaoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // width: 328,
          child: TextFormField(
            controller: widget.textEditingControllerInstituicaoDeEnsino,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Instituição de Ensino*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo instituição de ensino não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          // width: 328,
          child: TextFormField(
            controller: widget.textEditingControllerCurso,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Curso*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo Curso de ensino não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            controller: widget.textEditingControllerMatricula,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Matricula*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo matricula não pode ser vazio!';
              }

              return null;
            },
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          // width: 328,
          child: TextFormField(
            controller: widget.textEditingControllerTurno,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Turno*',
            ),
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'O campo turno não pode ser vazio!';
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
