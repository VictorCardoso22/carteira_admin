import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';

class RegistroCarteiraPage extends StatefulWidget {
  UserModel? user;

   RegistroCarteiraPage({
    Key? key, this.user
  }) : super(key: key);

  @override
  State<RegistroCarteiraPage> createState() {

    return _RegistroCarteiraPageState();
  }
}

class _RegistroCarteiraPageState extends State<RegistroCarteiraPage> {
  UserModel? userModel;


  @override
  void initState() {
    userModel = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        Text('Aluno: ${userModel!.nomeCompleto}'),
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
                          Text('${userModel!.cpf}'),
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
                          Text('${userModel!.rg}'),
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
                          Text('${userModel!.dataNascimento}'),
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
                          Text('${userModel!.endereco}'),
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
                          Text('${userModel!.endereco}'),
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
                          Text('${userModel!.endereco}'),
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
                          Text('${userModel!.endereco}'),
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
                          Text('${userModel!.endereco}'),
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
                        children:  [
                          Text('Instituição'),
                          Text('${userModel!.instituicao}'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text('Matricula:'),
                          Text('${userModel!.numeroMatriculaFaculdade}'),
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
                        children:  [
                          Text('${userModel!.turno}'),

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
                                  Image.network(
                                    '${userModel!.rgVersoAnexo}',
                                  ).image,
                                ));
                              },
                              child: Image.network(
                                '${userModel!.rgVersoAnexo}',
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
                            child:  Image.network(
                              '${userModel!.comprovanteResidenciaAnexo}',
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
                                  Image.network(
                                    '${userModel!.declaracaoEscolarAnexo}',
                                  ).image,
                                ));
                              },
                              child: Image.network(
                                '${userModel!.declaracaoEscolarAnexo}',
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
      ]),
    );
  }
}
