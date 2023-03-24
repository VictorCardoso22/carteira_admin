import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomCard extends StatelessWidget {
  String? titulo;
  String? valor;
  CustomCard({Key? key, this.titulo, this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 135,
      // padding: EdgeInsets.symmetric(vertical: 16),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              titulo!,
              style: TextStyle(fontSize: 20, color: kSupportColor),
            ),
            const SizedBox(height: 15),
            Text(
              valor!,
              style: TextStyle(fontSize: 40, color: Color(0xFF252733)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
