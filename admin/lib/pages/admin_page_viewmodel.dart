import 'package:admin/model/user.dart';
import 'package:admin/pages/carterias/carteiras_page.dart';
import 'package:admin/pages/dados/dados_page.dart';
import 'package:admin/pages/home_page/home_page.dart';
import 'package:admin/pages/registro_carteira/registro_carteira_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked/stacked.dart';

class AdminPageViewlModel extends BaseViewModel {
  SidebarXController controller =
      SidebarXController(selectedIndex: 0, extended: true);

  BuildContext baseContext;
  List<UserModel> listOfAlunos = [];

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

      // -- Esse aqui esta escondido. Pagina que mostra as informacoes do aluno
      case 4:
        return RegistroCarteiraPage();

      default:
        return const Text('Not found page');
    }
  }

  goToTab(index) {
    controller.selectIndex(index);
    notifyListeners();
  }

  getAlunos() async {
//    User? user = FirebaseAuth.instance.currentUser;
    listOfAlunos.clear();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        querySnapshot.docs.forEach((element) {
          listOfAlunos.add(UserModel.fromJson(element.data()));
        });

        notifyListeners();
      }
    });
  }
}
