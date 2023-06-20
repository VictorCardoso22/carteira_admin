import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Anexo extends StatelessWidget {
  final XFile arquivo;
  Uint8List webImage = Uint8List(8);
  Anexo({Key? key, required this.arquivo, required this.webImage})
      : super(key: key) {
    debugPrint("teste");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 340,
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: kIsWeb
              ? Image.memory(webImage, fit: BoxFit.cover)
              : Image.file(File(arquivo.path), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
