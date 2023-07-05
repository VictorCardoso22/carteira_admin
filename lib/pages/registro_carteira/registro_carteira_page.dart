import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/model/user.dart';
import 'package:admin/ui/colors.dart';
import 'package:admin/ui/text_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gallery_image_viewer/gallery_image_viewer.dart';

import '../../common_codes.dart';

class RegistroCarteiraPage extends StatefulWidget {
  UserModel? user;
  RegistroCarteiraPage({
    Key? key,
    this.user,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 56),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 26,
                      ),
                      label: const Text(
                        'Home',
                        style: kHeading5,
                      )),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Resgisto da carteira',
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF252733),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              Card(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            height: 180,
                            child: Image.network("${userModel!.fotoAnexo}"),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Aluno: ${userModel!.nomeCompleto}'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                                const Text('CPF'),
                                const SizedBox(width: 20),
                                Text('${userModel!.cpf}'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('RG'),
                                Text('${userModel!.rg}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Data de nascimento:'),
                                Text('${userModel!.dataNascimento}'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 20),

                      const SizedBox(height: 20),
                      const Text(
                        'ENDEREÇO',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF252733),
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        child: Text(
                          '${userModel!.endereco}',
                          textAlign: TextAlign.left,
                        ),
                      ),

                      const SizedBox(height: 20),
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
                              children: [
                                const Text('Instituição'),
                                Text('${userModel!.instituicao}'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Matricula:'),
                                Text('${userModel!.numeroMatriculaFaculdade}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        height: 50,
                        child: ListView(
                          shrinkWrap: true,
                          children:
                              userModel!.turno!.map((e) => Text('$e')).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
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
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(showImageViewer(
                                        context,
                                        Image.network(
                                          '${userModel!.comprovanteResidenciaAnexo}',
                                        ).image,
                                      ));
                                    },
                                    child: Image.network(
                                      '${userModel!.comprovanteResidenciaAnexo}',
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
                  CustomPrimaryButton(
                    titulo: 'Aprovar',
                    onPressed: () async {
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      await firestore
                          .collection('users')
                          .where('cpf', isEqualTo: '${userModel!.cpf}')
                          .get()
                          .then((QuerySnapshot querySnapshot) {
                        var id = querySnapshot.docs.first.id;
                        firestore
                            .collection('users')
                            .doc(id)
                            .update({'ativo': true});
                      });
                      toastAviso('Cadastro confirmado', kSuccessColor, context);
                      Get.back();
                      setState(() {});
                    },
                    type: CustomPrimaryButtonType.fill,
                  ),
                  const SizedBox(width: 32),
                  CustomPrimaryButton(
                    titulo: 'Recusar',
                    onPressed: () async {
                      FirebaseFirestore firestore = FirebaseFirestore.instance;
                      await firestore
                          .collection('users')
                          .where('cpf', isEqualTo: '${userModel!.cpf}')
                          .get()
                          .then((QuerySnapshot querySnapshot) {
                        var id = querySnapshot.docs.first.id;
                        firestore
                            .collection('users')
                            .doc(id)
                            .update({'ativo': false});
                      });
                      toastAviso('Cadastro recusado', kErrorColor, context);
                      Get.back();
                      setState(() {});
                    },
                    type: CustomPrimaryButtonType.outline,
                    small: true,
                  ),
                ],
              ),
              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
