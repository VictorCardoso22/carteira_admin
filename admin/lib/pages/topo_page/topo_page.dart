import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';

class TopoPage extends StatefulWidget {
  const TopoPage({Key? key}) : super(key: key);

  @override
  State<TopoPage> createState() => _TopoPageState();
}

class _TopoPageState extends State<TopoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.amber,
      child: Row(
        children: [
          const SizedBox(width: 10),
          // _buildIcon(
          //     heightBox: 40, icon: Icons.notifications_none, onPressed: () {}),
          // const SizedBox(width: 10),
          // _buildPersonalInfo(
          //   heightBox: 40,
          //   name: 'Fulano de tal',
          // )
        ],
      ),
    );
  }

  // Widget _buildIcon({double? heightBox, IconData? icon, onPressed}) {
  //   return Container(
  //       constraints: BoxConstraints.tightFor(
  //         width: 60,
  //         height: heightBox,
  //       ),
  //       child: TextButton.icon(
  //         onPressed: () {},
  //         icon: Icon(
  //           icon,
  //           color: kOnPrimaryContainerColor,
  //           size: 25,
  //         ),
  //         label: Text(""),
  //       ));
  // }

  // Widget _buildPersonalInfo({
  //   double? heightBox,
  //   // ignore: unused_element
  //   String? imagePerfil,
  //   String? name,
  // }) {
  //   double? _heightBox = heightBox;
  //   String? _name = name;

  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(5),
  //       ),
  //       color: Colors.red,
  //     ),
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 10,
  //       vertical: 5,
  //     ),
  //     height: _heightBox,
  //     child: Row(
  //       children: [
  //         CircleAvatar(),
  //         const SizedBox(width: 12),
  //         Container(
  //             child: Text(
  //           _name!,
  //         )),
  //       ],
  //     ),
  //   );
  // }
}
