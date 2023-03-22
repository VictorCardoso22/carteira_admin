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
  List<UserModel> listOfAlunosAtivos = [];
  List<UserModel> listOfAlunosInativos = [];
  List<UserModel> listFiltradaNome = [];
  int ativos = 0;
  int inativos = 0;
  HomePage? homePage;
  CarteirasPage? carteirasPage;

  AdminPageViewlModel(BuildContext this.baseContext) {
    homePage = HomePage(adminPageViewlModel: this);
    carteirasPage = CarteirasPage(adminPageViewlModel: this);
  }

  getPageByIndex(int index) {
    switch (index) {
      case 0:
        return homePage;
      case 1:
        return carteirasPage;
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
    listOfAlunos.clear();
    ativos = 0;
    inativos = 0;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        querySnapshot.docs.forEach((element) {
          UserModel userModel = UserModel.fromJson(element.data());
          listOfAlunos.add(userModel);
          if (userModel.ativo == true) {
            listOfAlunosAtivos.add(userModel);
            ativos++;
          } else {
            listOfAlunosInativos.add(userModel);
            inativos++;
          }
        });
        if (controller.selectedIndex == 0) {
          homePage!.homePageState?.setState(() {});
        } else if (controller.selectedIndex == 1) {
          carteirasPage!.carteirasPageState?.setState(() {});
        }

        //notifyListeners();
      }
    });
  }
}
