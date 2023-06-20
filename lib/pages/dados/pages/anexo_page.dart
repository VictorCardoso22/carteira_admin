import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:admin/ui/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'widgets/anexo.dart';

class AnexoPage extends StatefulWidget {
  AnexoPage({Key? key}) : super(key: key);
  // Mobile
  XFile? arquivoFoto;
  XFile? arquivoRgFrente;
  XFile? arquivoRgVerso;
  XFile? arquivoComprovanteResidencia;
  XFile? arquivoDeclaracaoEscolar;
  // Web
  Uint8List? arquivoFotoWeb = Uint8List(8);
  Uint8List? arquivoRgFrenteWeb = Uint8List(8);
  Uint8List? arquivoRgVersoWeb = Uint8List(8);
  Uint8List? arquivoComprovanteResidenciaWeb = Uint8List(8);
  Uint8List? arquivoDeclaracaoEscolarWeb = Uint8List(8);

  @override
  State<AnexoPage> createState() => _AnexoPageState();
}

class _AnexoPageState extends State<AnexoPage> {
  XFile? _pickedImage;
  Uint8List webImage = Uint8List(8);

  Future<void> getFileFromGallery(XFile? image, String nomeArquivo) async {
    // final file = await picker.getImage(source: ImageSource.gallery);
    // final file = await picker.pickImage(source: ImageSource.gallery);

    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      image = (await picker.pickImage(source: ImageSource.gallery));
      if (image != null) {
        var selected = XFile(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('no image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      image = (await picker.pickImage(source: ImageSource.gallery));
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = XFile('a');
        });
      } else {
        print('no image has been picked');
      }
    } else {
      print('Sometihing wrong');
    }

    setState(() {
      if (nomeArquivo == "arquivoFoto") {
        widget.arquivoFotoWeb = webImage;
        widget.arquivoFoto = image;
      }
      if (nomeArquivo == "arquivoRgFrente") {
        widget.arquivoRgFrenteWeb = webImage;
        widget.arquivoRgFrente = image;
      }
      if (nomeArquivo == "arquivoRgVerso") {
        widget.arquivoRgVersoWeb = webImage;
        widget.arquivoRgVerso = image;
      }
      if (nomeArquivo == "arquivoComprovanteResidencia") {
        widget.arquivoComprovanteResidenciaWeb = webImage;
        widget.arquivoComprovanteResidencia = image;
      }
      if (nomeArquivo == "arquivoDeclaracaoEscolar") {
        widget.arquivoDeclaracaoEscolarWeb = webImage;
        widget.arquivoDeclaracaoEscolar = image;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (widget.arquivoFoto != null)
                Anexo(
                    arquivo: widget.arquivoFoto!,
                    webImage: widget.arquivoFotoWeb!),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Foto',
                          style: TextStyle(color: kPrimaryDarkColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery(
                              widget.arquivoFoto, "arquivoFoto")),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 28),
        Container(
          width: 382,
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                // width: 181,
                // height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: kPrimaryLightColor),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Stack(
                  children: [
                    if (widget.arquivoRgFrente != null)
                      SizedBox(
                          width: 150,
                          child: Anexo(
                              arquivo: widget.arquivoRgFrente!,
                              webImage: widget.arquivoRgFrenteWeb!)),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'RG - Frente',
                                style: TextStyle(color: kPrimaryDarkColor),
                              )),
                        ),
                        Spacer(),
                        SizedBox(
                          // width: 300,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(width: 30),
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: kPrimaryLightColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: (() => getFileFromGallery(
                                      widget.arquivoRgFrente,
                                      "arquivoRgFrente")),

                                  icon: const Icon(
                                    Icons.drive_file_move_rounded,
                                    color: kPrimaryDarkColor,
                                  ),
                                  // child: Text("Anexar imagem"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Container(
                // width: 181,
                // height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: kPrimaryLightColor),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Stack(
                  children: [
                    if (widget.arquivoRgVerso != null)
                      SizedBox(
                          width: 150,
                          child: Anexo(
                              arquivo: widget.arquivoRgVerso!,
                              webImage: widget.arquivoRgVersoWeb!)),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'RG - Verso',
                                style: TextStyle(color: kPrimaryDarkColor),
                              )),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: 30),
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: kPrimaryLightColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                onPressed: (() => getFileFromGallery(
                                    widget.arquivoRgVerso, "arquivoRgVerso")),

                                icon: const Icon(
                                  Icons.drive_file_move_rounded,
                                  color: kPrimaryDarkColor,
                                ),
                                // child: Text("Anexar imagem"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        // Comprovante de Residência
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (widget.arquivoComprovanteResidencia != null)
                Anexo(
                    arquivo: widget.arquivoComprovanteResidencia!,
                    webImage: widget.arquivoComprovanteResidenciaWeb!),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Comprovante de Residência',
                          style: TextStyle(color: kPrimaryDarkColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery(
                                widget.arquivoComprovanteResidencia,
                                "arquivoComprovanteResidencia",
                              )),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 28),
        // Declaração Escolar
        Container(
          width: 382,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                style: BorderStyle.solid, width: 1, color: kPrimaryLightColor),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Stack(
            children: [
              if (widget.arquivoDeclaracaoEscolar != null)
                Anexo(
                    arquivo: widget.arquivoDeclaracaoEscolar!,
                    webImage: widget.arquivoDeclaracaoEscolarWeb!),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Declaração Escolar',
                          style: TextStyle(color: kPrimaryDarkColor),
                        )),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 32),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: (() => getFileFromGallery(
                              widget.arquivoDeclaracaoEscolar,
                              "arquivoDeclaracaoEscolar")),

                          icon: const Icon(
                            Icons.drive_file_move_rounded,
                            color: kPrimaryDarkColor,
                          ),
                          // child: Text("Anexar imagem"),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
