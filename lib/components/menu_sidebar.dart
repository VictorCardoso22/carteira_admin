import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../ui/colors.dart';

class MenuSidebarX extends StatelessWidget {
  const MenuSidebarX({
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
        return Align(
          // height: 80,
          alignment: Alignment.center,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 26.0, horizontal: 10),
              child: Image.asset(
                'assets/e-cart1.png',
                width: 180,
              )),
        );
      },
      headerDivider: divider,
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
      // footerDivider: divider,
      footerBuilder: (context, extended) {
        return Wrap(
          runSpacing: 16,
          spacing: 16,
          children: [
            Align(
              // height: 80,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logo.png',
                width: 100,
              ),
            ),
            Align(
              // height: 80,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/6codew.png',
                width: 100,
              ),
            ),
            divider,
          ],
        );
      },
      // footerItems: [
      //   SidebarXItem(

      //     iconWidget: Align(
      //       // height: 80,
      //       alignment: Alignment.center,
      //       child: Image.asset(
      //         'assets/6codew.png',
      //         width: 80,
      //       ),
      //     ),
      //   ),
      //   SidebarXItem(
      //     iconWidget: Align(
      //       // height: 80,
      //       alignment: Alignment.center,
      //       child: Image.asset(
      //         'assets/logo.png',
      //         width: 80,
      //       ),
      //     ),
      //   )
      // ],
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
                // TopoPage(
                //   nome: '${DataUser.dataUser!.nomeCompleto}',
                //   imagemPerfil: "${DataUser.dataUser!.fotoAnexo}",
                // ),
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

const primaryColor = kBackgroundLightColor;
const canvasColor = kPrimaryLightColor;
const scaffoldBackgroundColor = kBackgroundDarkColor2;
const accentCanvasColor = kBackgroundLightColor;
const white = Colors.white;
// final actionColor = const Color(0xFFF4F5F7);
final divider = Divider(color: white.withOpacity(0.3), height: 2);
