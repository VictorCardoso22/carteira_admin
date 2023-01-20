import 'package:admin/components/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';

class registroCarteiraPage extends StatefulWidget {
  const registroCarteiraPage({
    Key? key,
  }) : super(key: key);

  @override
  State<registroCarteiraPage> createState() => _registroCarteiraPageState();
}

class _registroCarteiraPageState extends State<registroCarteiraPage> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Resgisto da carteira',
        style: TextStyle(
            fontSize: 24,
            color: Color(0xFF252733),
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 55),
      Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: Image.asset(
                      'assets/perfil.jpg',
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Aluno:'),
                      Text('DataUser.dataUser!.nomeCompleto'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Text(
                'DADOS PESSOAIS ',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF252733),
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CPF'),
                        SizedBox(width: 20),
                        Text('000.000.000-00'),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RG'),
                        Text('00000000'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Data de nascimento:'),
                        Text('00/00/0000'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
              const SizedBox(height: 20),

              SizedBox(height: 20),
              const Text(
                'ENDEREÇO',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF252733),
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CEP'),
                        SizedBox(width: 20),
                        Text('00000-00'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Logradouro'),
                        SizedBox(width: 20),
                        Text('Rua x '),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Numero'),
                        Text('000'),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bairro'),
                        Text('Centro'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Complemento'),
                        SizedBox(width: 20),
                        Text('------'),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              const Text(
                'DADOS INSTITUIÇÃO',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF252733),
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Instituição'),
                        Text('Uncisal'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Matricula:'),
                        Text('xxxxxxxx'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Turnos'),
                        Text('Vespertino'),
                        Text('Noturno'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // ANEXOS
              const Text(
                'ANEXOS',
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF252733),
                    fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('RG'),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 100,
                          height: 100,
                          // color: Colors.amberAccent,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(showImageViewer(
                                context,
                                Image.asset(
                                  'assets/rg.jpg',
                                ).image,
                              ));
                            },
                            child: Image.asset(
                              'assets/rg.jpg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('COMPROVANTE DE RESIDÊNCIA'),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 100,
                          height: 100,
                          // color: Colors.amberAccent,
                          child: Image.asset(
                            'assets/qrcode.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('DECLARAÇÃO ESCOLAR'),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 100,
                          height: 100,
                          // color: Colors.amberAccent,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(showImageViewer(
                                context,
                                Image.asset(
                                  'assets/declaracao.png',
                                ).image,
                              ));
                            },
                            child: Image.asset(
                              'assets/declaracao.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 32),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPrimaryButton(titulo: 'Aprovar', onPressed: () {}),
          const SizedBox(width: 32),
          TextButton(onPressed: () {}, child: Text('Recusar'))
        ],
      ),
      const SizedBox(height: 32),
    ]);
  }
}
