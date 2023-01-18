import 'package:admin/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
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
        return HomePage();
      case 1:
        return Text('Home 2');
        ;
      case 2:
        return Text('Home 3');
        ;

      case 3:
        return Text('Home 4');
        ;

      // case 4:
      //   Future.delayed(Duration.zero, () {
      //     // ?????????????????????????????????????????????? Funciona nao sei porque
      //     logout(baseContext);
      //   });
      //   return Container();

      default:
        return const Text('Not found page');
    }
  }

  goToTab(index) {
    controller.selectIndex(index);
    notifyListeners();
  }
}
