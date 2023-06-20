import 'dart:io';

import 'package:admin/common_codes.dart';
import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/model/user.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/dados/pages/anexo_page.dart';
import 'package:admin/pages/dados/pages/dados_pessoais_page.dart';
import 'package:admin/pages/dados/pages/instituicao_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file/cross_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DadosPage extends StatefulWidget {
  DadosPessoaisPage? dadosPessoaisPage;
  InstituicaoPage? instituicaoPage;
  AnexoPage? anexoPage;
  bool isCreating = false;

  DadosPage({Key? key}) : super(key: key) {
    dadosPessoaisPage = DadosPessoaisPage();
    instituicaoPage = InstituicaoPage();
    anexoPage = AnexoPage();
  }

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
  bool isVerticalStepper = false;
  late AdminPageViewlModel adminPageViewlModel;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
        primary: kPrimaryLightColor,
      )),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
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
                        subtitle:
                            const Text('visualização vertical/horizontal'),
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
                      registerUserFirebase();
                    } else {
                      setState(() {
                        bool listTurnoBoolean = true;

                        if (_index == 1) {
                          if (widget.instituicaoPage!.listTurno.isEmpty) {
                            listTurnoBoolean = false;
                            toastAviso("Defina o turno que estuda", Colors.red,
                                context);
                          }
                        }

                        if (((_formKeys[_index].currentState!.validate()) &&
                                listTurnoBoolean) ??
                            false) {
                          continued();
                          //print('continuando $isLastStep');
                        }
                      });
                    }

                    //  _formKeys[_index].currentState?.validate()
                  },
                  onStepCancel: cancel,
                  steps: getSteps(),
                  controlsBuilder: (context, details) => Column(
                    children: [
                      widget.isCreating
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : CustomPrimaryButton(
                              type: CustomPrimaryButtonType.fill,
                              titulo: _index == getSteps().length - 1
                                  ? 'Enviar'
                                  : 'Avançar',
                              onPressed: details.onStepContinue!),
                      const SizedBox(height: 10),
                      if (_index != 0)
                        widget.isCreating
                            ? const Text("Enviando...")
                            : TextButton(
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
            child: Form(key: _formKeys[0], child: widget.dadosPessoaisPage!),
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
            child: Form(key: _formKeys[1], child: widget.instituicaoPage!),
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
            child: Form(key: _formKeys[2], child: widget.anexoPage!),
          ),
          isActive: _index >= 0,
          state: _index >= 2 ? StepState.complete : StepState.disabled,
        ),
      ];

  registerUserFirebase() async {
    String email = widget.dadosPessoaisPage!.textEditingControllerEmail.text;
    String password = widget.dadosPessoaisPage!.textEditingControllerSenha.text;
    debugPrint("$email aaaa");
    debugPrint("$password bbb");
    UserCredential userCredential;
    // setState(() {
    //   isLoading = true;
    // });
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //debugPrint("teste");
      setState(() {
        widget.isCreating = true;
      });
      await addUserFirebase(userCredential.user!.uid);
      setState(() {
        widget.isCreating = false;
      });
      toastAviso("Cadastro criado com sucesso!", Colors.greenAccent, context);
      Get.toNamed('/home');
      debugPrint("teste");
    } on FirebaseAuthException catch (e) {
      debugPrint("teste");
      if (e.code == 'weak-password') {
        // setState(() {
        //   isLoading = false;
        // });
        toastAviso("Senha fraca, favor colocar uma senha mais forte",
            Colors.red, context);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // setState(() {
        //   isLoading = false;
        // });
        toastAviso("Já existe um cadastro com esse email", Colors.red, context);
        print('The account already exists for that email.');
      } else if (e.code == "invalid-email") {
        toastAviso("Email invalido", Colors.red, context);
      }
      print('${e.code}');
    } catch (e) {
      print(e);
    }
  }

  addUserFirebase(String uidUser) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    UserModel userModel = UserModel();

    ///Step 1
    String cpfText = widget.dadosPessoaisPage!.textEditingControllerCpf.text;
    userModel.nome =
        widget.dadosPessoaisPage!.textEditingControllerNomeCompleto.text;
    userModel.nomeCompleto =
        widget.dadosPessoaisPage!.textEditingControllerNomeCompleto.text;
    userModel.cpf = widget.dadosPessoaisPage!.maskFormatterCPF
        .unmaskText(cpfText); // Mandar cpf sem a mascara.
    userModel.rg = widget.dadosPessoaisPage!.textEditingControllerRg.text;
    userModel.dataNascimento =
        widget.dadosPessoaisPage!.textEditingControllerDataNascimento.text;
    userModel.endereco = """ 
    Logradouro: ${widget.dadosPessoaisPage!.textEditingControllerLogradouro.text} 
    Bairro: ${widget.dadosPessoaisPage!.textEditingControllerBairro.text}
    Número: ${widget.dadosPessoaisPage!.textEditingControllerNumeroEndereco.text}
    Complemento: ${widget.dadosPessoaisPage!.textEditingControllerComplemento.text}
    """;

    ///--------------------------------------------------------------------------------------------------///

    ///Step 2
    userModel.email =
        widget.dadosPessoaisPage!.textEditingControllerEmail.text.trim();
    userModel.turno = widget.instituicaoPage!.listTurno;
    userModel.curso = widget.instituicaoPage!.textEditingControllerCurso.text;
    userModel.instituicao =
        widget.instituicaoPage!.textEditingControllerInstituicaoDeEnsino.text;
    userModel.numeroMatriculaFaculdade =
        widget.instituicaoPage!.textEditingControllerMatricula.text;
    userModel.instituicao =
        widget.instituicaoPage!.textEditingControllerInstituicaoDeEnsino.text;

    ///---------------------------------------------------------------------------------------------------///

    ///Step 3
     userModel.rgFrenteAnexo = await addUserImages(
         file: XFile(widget.anexoPage!.arquivoRgFrente!.path),
         nameFile: "rgFrente");
    userModel.rgVersoAnexo = await addUserImages(
        file: XFile(widget.anexoPage!.arquivoRgVerso!.path),
        nameFile: "rgVerso");
    userModel.fotoAnexo = await addUserImages(
        file: XFile(widget.anexoPage!.arquivoFoto!.path),
        nameFile: "fotoPerfil");
    userModel.comprovanteResidenciaAnexo = await addUserImages(
        file: XFile(widget.anexoPage!.arquivoComprovanteResidencia!.path),
        nameFile: "comprovanteResidencia");
    userModel.declaracaoEscolarAnexo = await addUserImages(
        file: XFile(widget.anexoPage!.arquivoDeclaracaoEscolar!.path),
        nameFile: "decalaracaoEscolar");

    ///--------------------------------------------------------------------------------------------------///

    userModel.ativo = false; // O usuario tem que ser aprovado para ficar ativo
    userModel.timeStampCriacao = DateTime.now().toIso8601String();
    firestore
        .collection('users')
        .doc(uidUser)
        .set(userModel.toJson())
        .then((value) {
      setState(() {});
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<String> addUserImages({XFile? file, nameFile}) async {
    final _firebaseStorage = FirebaseStorage.instance;
    User? user = FirebaseAuth.instance.currentUser;
    //Upload to Firebase
    var snapshot = await _firebaseStorage
        .ref()
        .child('${user!.uid}/$nameFile')
        .putData(await file!.readAsBytes());
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
