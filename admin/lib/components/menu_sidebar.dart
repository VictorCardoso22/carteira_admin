import 'package:admin/common_codes.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/topo_page/topo_page.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class MenuSidebarX extends StatelessWidget {
  MenuSidebarX({
    key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        decoration: const BoxDecoration(
          color: canvasColor,
        ),
        textStyle: const TextStyle(
            color: accentCanvasColor,
            fontSize: 16,
            fontWeight: FontWeight.w400),
        selectedTextStyle: const TextStyle(color: accentCanvasColor),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          color: scaffoldBackgroundColor,
          border: Border(left: BorderSide(color: accentCanvasColor, width: 2)),
        ),
        iconTheme: const IconThemeData(
          color: accentCanvasColor,
          size: 25,
        ),
        selectedIconTheme: const IconThemeData(
          color: accentCanvasColor,
          size: 25,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 250,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      headerBuilder: (context, extended) {
        return const Align(
          // height: 80,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 10),
            child: Text(
              'ADMIN',
              style: TextStyle(color: accentCanvasColor, fontSize: 22),
            ),
          ),
        );
      },
      // headerDivider: divider,
      footerDivider: divider,
      items: [
        const SidebarXItem(
          icon: Icons.dashboard_rounded,
          label: 'Dashboard',
        ),
        const SidebarXItem(
          icon: Icons.post_add,
          label: 'Cadastros',
        ),
        const SidebarXItem(
          icon: Icons.add_to_photos,
          label: 'Novo',
        ),
        SidebarXItem(
          icon: Icons.logout_rounded,
          label: 'Sair do sistema',
          onTap: () {
            debugPrint('Sair');
          },
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Screens extends StatelessWidget {
  Screens({
    key,
    required this.controller,
    required this.adminPageViewlModel,
  }) : super(key: key);

  final SidebarXController controller;
  AdminPageViewlModel adminPageViewlModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.zero,
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TopoPage(
                  nome: '${DataUser.dataUser!.nomeCompleto}',
                  imagemPerfil: "${DataUser.dataUser!.fotoAnexo}",
                ),
                const SizedBox(height: 22),
                adminPageViewlModel.getPageByIndex(controller.selectedIndex)
              ],
            ),
          ),
        );
      },
    );
  }
}

const primaryColor = Color(0xFFF7F8FC);
const canvasColor = Color(0xFF363740);
const scaffoldBackgroundColor = Color(0xFF868896);
const accentCanvasColor = Color(0xFFDDE2FF);
const white = Colors.white;
// final actionColor = const Color(0xFFF4F5F7);
final divider = Divider(color: white.withOpacity(0.3), height: 2);
