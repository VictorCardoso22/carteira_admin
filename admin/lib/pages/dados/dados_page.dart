import 'dart:io';

import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/dados/pages/anexo_page.dart';
import 'package:admin/pages/dados/pages/dados_pessoais_page.dart';
import 'package:admin/pages/dados/pages/instituicao_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DadosPage extends StatefulWidget {
  const DadosPage({Key? key}) : super(key: key);

  @override
  State<DadosPage> createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  int _index = 0;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  bool isCompleted = false;
  DadosPessoaisPage dadosPessoaisPage = DadosPessoaisPage();
  InstituicaoPage instituicaoPage = InstituicaoPage();
  AnexoPage anexoPage = AnexoPage();
  bool isVerticalStepper = false;
  late AdminPageViewlModel adminPageViewlModel;
  @override
  Widget build(BuildContext context) {
    return isCompleted
        ? Text('Completo')
        : Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
              primary: kPrimaryLightColor,
            )),
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Novo cadastro',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryLightColor,
                          ),
                        ),
                        SizedBox(
                          width: 300,
                          child: SwitchListTile(
                              title: const Text('Visualização vertical?'),
                              subtitle: const Text(
                                  'visualização vertical/horizontal'),
                              value: isVerticalStepper,
                              onChanged: (_) {
                                setState(() {
                                  isVerticalStepper = !isVerticalStepper;
                                });
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Stepper(
                        elevation: 0,
                        type: isVerticalStepper
                            ? StepperType.vertical
                            : StepperType.horizontal,
                        physics: const ScrollPhysics(),
                        currentStep: _index,
                        onStepTapped: (step) => tapped(step),
                        onStepContinue: () {
                          final isLastStep = _index == getSteps().length - 1;
                          if (isLastStep) {
                            // registerUserFirebase();
                            //  Map allData = Map();
                            //map[""] = "";

                            //print('Completed $isLastStep');
                          }

                          setState(() {
                            if (_formKeys[_index].currentState?.validate() ??
                                false) {
                              continued();
                              //print('continuando $isLastStep');
                            }
                          });

                          //  _formKeys[_index].currentState?.validate()
                        },
                        onStepCancel: cancel,
                        steps: getSteps(),
                        controlsBuilder: (context, details) => Column(
                          children: [
                            CustomPrimaryButton(
                              titulo: _index == getSteps().length - 1
                                  ? 'Enviar'
                                  : 'Avançar',
                              onPressed: details.onStepContinue!,
                              type: CustomPrimaryButtonType.fill,
                            ),
                            const SizedBox(height: 10),
                            if (_index != 0)
                              TextButton(
                                  onPressed: details.onStepCancel!,
                                  child: const Text('Voltar')),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  List<Step> getSteps() => [
        Step(
          title: const Text(
            'Pessoal',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Form(key: _formKeys[0], child: dadosPessoaisPage),
          ),
          isActive: _index >= 0,
          state: _index >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text(
            'Instituição',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Form(key: _formKeys[1], child: instituicaoPage),
          ),
          isActive: _index >= 0,
          state: _index >= 1 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text(
            'Anexos',
            style: TextStyle(fontSize: 12),
          ),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Form(key: _formKeys[2], child: anexoPage),
          ),
          isActive: _index >= 0,
          state: _index >= 2 ? StepState.complete : StepState.disabled,
        ),
      ];

  // registerUserFirebase() async {
  //   String email = dadosPessoaisPage.textEditingControllerEmail.text;
  //   String password = dadosPessoaisPage.textEditingControllerSenha.text;
  //   debugPrint("$email aaaa");
  //   debugPrint("$password bbb");
  //   UserCredential userCredential;
  // setState(() {
  //   isLoading = true;
  // });
  // try {
  //   userCredential = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password);
  //   debugPrint("teste");
  //   addUserFirebase(userCredential.user!.uid);
  //   setState(() => isCompleted = true);
  //   toastAviso("Cadastro criado com sucesso!", Colors.greenAccent, context);
  //   debugPrint("teste");
  // } on FirebaseAuthException catch (e) {
  //   debugPrint("teste");
  //   if (e.code == 'weak-password') {
  //     // setState(() {
  //     //   isLoading = false;
  //     // });
  //     toastAviso("Senha fraca, favor colocar uma senha mais forte",
  //         Colors.red, context);
  //     print('The password provided is too weak.');
  //   } else if (e.code == 'email-already-in-use') {
  //     // setState(() {
  //     //   isLoading = false;
  //     // });
  //     toastAviso("Já existe um cadastro com esse email", Colors.red, context);
  //     print('The account already exists for that email.');
  //   }
  //   print('${e.code}');
  // } catch (e) {
  //   print(e);
  // }
  // }

  // addUserFirebase(String uidUser) async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  // UserModel userModel = UserModel();
  // userModel.nome = dadosPessoaisPage.textEditingControllerNomeCompleto.text;
  // userModel.nomeCompleto =
  //     dadosPessoaisPage.textEditingControllerNomeCompleto.text;
  // userModel.cpf = dadosPessoaisPage.textEditingControllerCpf.text;
  // userModel.rg = dadosPessoaisPage.textEditingControllerRg.text;
  // userModel.rgFrenteAnexo = await addUserImages(
  //     file: anexoPage.arquivoRgFrente, nameFile: "rgFrente");
  // userModel.rgVersoAnexo = await addUserImages(
  //     file: anexoPage.arquivoRgVerso, nameFile: "rgVerso");
  // userModel.fotoAnexo = await addUserImages(
  //     file: anexoPage.arquivoFoto, nameFile: "fotoPerfil");
  // userModel.comprovanteResidenciaAnexo = await addUserImages(
  //     file: anexoPage.arquivoComprovanteResidencia,
  //     nameFile: "comprovanteResidencia");
  // userModel.declaracaoEscolarAnexo = await addUserImages(
  //     file: anexoPage.arquivoDeclaracaoEscolar,
  //     nameFile: "decalaracaoEscolar");
  // // //  userModel.curso = instituicaoPage. ;
  // userModel.email = dadosPessoaisPage.textEditingControllerEmail.text;
  // userModel.curso = instituicaoPage.textEditingControllerCurso.text;
  // userModel.instituicao =
  //     instituicaoPage.textEditingControllerInstituicaoDeEnsino.text;
  // userModel.endereco = dadosPessoaisPage.textEditingControllerLogradouro.text;
  // userModel.dataNascimento =
  //     dadosPessoaisPage.textEditingControllerDataNascimento.text;
  // userModel.numeroMatriculaFaculdade =
  //     instituicaoPage.textEditingControllerMatricula.text;
  // userModel.instituicao =
  //     instituicaoPage.textEditingControllerInstituicaoDeEnsino.text;

  // firestore
  //     .collection('users')
  //     .doc(uidUser)
  //     .set(userModel.toJson())
  //     .then((value) {
  //   setState(() {});
  // }).catchError((error) => print("Failed to add user: $error"));
  // }

  Future<String> addUserImages({File? file, nameFile}) async {
    final _firebaseStorage = FirebaseStorage.instance;
    User? user = FirebaseAuth.instance.currentUser;
    //Upload to Firebase
    var snapshot = await _firebaseStorage
        .ref()
        .child('${user!.uid}/$nameFile')
        .putFile(file!);
    var downloadUrl = await snapshot.ref.getDownloadURL();
    setState(() {
      // imageUrl = downloadUrl;
    });
    return downloadUrl;
  }

  tapped(int step) {
    setState(() => _index = step);
  }

  continued() {
    _index < 2 ? setState(() => _index += 1) : null;
  }

  cancel() {
    _index > 0 ? setState(() => _index -= 1) : null;
  }
}
