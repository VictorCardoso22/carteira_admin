import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';

class TopoPage extends StatefulWidget {
  String? titulo;

  TopoPage({Key? key, this.titulo}) : super(key: key);

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
          // const Text(
          //   "Dashboard",
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          // ),
          // Spacer(),
          const SizedBox(width: 10),
          _buildIcon(
              heightBox: 40, icon: Icons.notifications_none, onPressed: () {}),
          const SizedBox(width: 10),
          _buildPersonalInfo(
            name: 'Fulano de tal',
          )
        ],
      ),
    );
  }

  Widget _buildIcon({double? heightBox, IconData? icon, onPressed}) {
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

  Widget _buildPersonalInfo({
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
        const SizedBox(width: 12),
        CircleAvatar(
          maxRadius: 35,
        ),
      ],
    );
  }
}
