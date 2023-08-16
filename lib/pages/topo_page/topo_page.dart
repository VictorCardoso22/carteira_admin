import 'package:admin/common_codes.dart';
import 'package:admin/components/menu_sidebar.dart';
import 'package:admin/model/user.dart';
import 'package:admin/ui/colors.dart';
import 'package:admin/ui/text_style.dart';
import 'package:flutter/material.dart';

class TopoPage extends StatefulWidget {
  TopoPage({Key? key}) : super(key: key);

  @override
  State<TopoPage> createState() => _TopoPageState();
}

class _TopoPageState extends State<TopoPage> {
  String? imagemPerfil = "";
  String? nome = "";

  @override
  void initState() {
    UserModel? dataUser = getDataUser(context);
    if (dataUser != null) {
      imagemPerfil = dataUser.fotoAnexo;
      nome = dataUser.nome;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('ADMIN CARTEIRA ESTUDANTIL',
              style: TextStyle(
                  color: kPrimaryLightColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          const Spacer(),
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
            name: nome,
            imagePerfil: imagemPerfil,
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
          label: const Text(""),
        ));
  }

  Widget _personalInfo({
    String? imagePerfil,
    String? name,
  }) {
    return Row(
      children: [
        Container(child: Text(name!, style: kHeading6)),
        const SizedBox(width: 18),
        SizedBox(
          height: 55,
          width: 55,
          child: Stack(
            fit: StackFit.loose,
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
