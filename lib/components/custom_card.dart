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
    return SizedBox(
      width: 240,
      height: 80,
      // padding: EdgeInsets.symmetric(vertical: 16),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              titulo!,
              style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF252733),
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              valor!,
              style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF252733),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
