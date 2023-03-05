import 'package:admin/pages/carterias/carteiras_page.dart';
import 'package:admin/pages/dados/dados_page.dart';
import 'package:admin/pages/home_page/home_page.dart';
import 'package:admin/pages/registro_carteira/registro_carteira_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';

class AdminPageViewlModel extends BaseViewModel {
  SidebarXController controller =
      SidebarXController(selectedIndex: 0, extended: true);

  BuildContext baseContext;

  AdminPageViewlModel(BuildContext this.baseContext);

  getPageByIndex(int index) {
    switch (index) {
      case 0:
        return HomePage(adminPageViewlModel: this);
      case 1:
        return CarteirasPage(adminPageViewlModel: this);
      case 2:
        return const DadosPage();
      case 3:
        Future.delayed(Duration.zero, () {
          Get.offAllNamed("/login");
        });
        return Container();
      case 4:
        return registroCarteiraPage();

      default:
        return const Text('Not found page');
    }
  }

  goToTab(index) {
    controller.selectIndex(index);
    notifyListeners();
  }
}
