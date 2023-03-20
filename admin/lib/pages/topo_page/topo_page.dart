import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';

class TopoPage extends StatefulWidget {
  String? imagemPerfil;
  String? nome;

  TopoPage({Key? key, this.imagemPerfil, this.nome}) : super(key: key);

  @override
  State<TopoPage> createState() => _TopoPageState();
}

class _TopoPageState extends State<TopoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 10),
          _icon(
              heightBox: 40, icon: Icons.notifications_none, onPressed: () {}),
          const SizedBox(width: 10),
          Container(
            height: 20,
            width: 2,
            color: kPrimaryContainerColor,
          ),
          const SizedBox(width: 30),
          _personalInfo(
            name: widget.nome,
            imagePerfil: widget.imagemPerfil,
          )
        ],
      ),
    );
  }

  Widget _icon({double? heightBox, IconData? icon, onPressed}) {
    return Container(
        constraints: BoxConstraints.tightFor(
          width: 60,
          height: heightBox,
        ),
        child: TextButton.icon(
          onPressed: () {},
          icon: Icon(
            icon,
            color: kOnPrimaryContainerColor,
            size: 25,
          ),
          label: Text(""),
        ));
  }

  Widget _personalInfo({
    String? imagePerfil,
    String? name,
  }) {
    String? _name = name;

    return Row(
      children: [
        Container(
            child: Text(
          _name!,
        )),
        const SizedBox(width: 18),
        SizedBox(
          height: 55,
          width: 55,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(imagePerfil.toString()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
