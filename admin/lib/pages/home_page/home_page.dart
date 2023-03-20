import 'package:admin/common_codes.dart';
import 'package:admin/components/custom_card.dart';
import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/model/user.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/tabela_carteiras/tabela_carteiras_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  AdminPageViewlModel adminPageViewlModel;
  HomePage({Key? key, required this.adminPageViewlModel});
  HomePageState? homePageState;

  @override
  State<HomePage> createState() {
    homePageState = HomePageState();
    return homePageState!;
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // List<UserModel> listOfAlunos = widget.adminPageViewlModel.listOfAlunos;

    // listOfAlunos.forEach((element) {
    //   // ignore: unrelated_type_equality_checks
    //   if (element.ativo == true) {
    //     widget.ativos;
    //   } else {
    //     widget.inativos + 1;
    //   }
    // });

    // listOfAlunosAtivo.map((e) => ativos = e.ativo.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 24,
              color: Color(0xFF252733),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCard(
              titulo: 'Carteiras cadastradas',
              valor: '${widget.adminPageViewlModel.listOfAlunos.length}',
            ),
            CustomCard(
                titulo: 'Carteiras aprovadas',
                valor: '${widget.adminPageViewlModel.ativos}'),
            CustomCard(
              titulo: 'Carteiras pendentes',
              valor: '${widget.adminPageViewlModel.inativos}',
            ),
          ],
        ),
        const SizedBox(height: 42),
        Align(
          alignment: Alignment.topRight,
          child: CustomPrimaryButton(
            titulo: 'Cadastrar nova carteirinha',
            onPressed: () => widget.adminPageViewlModel.goToTab(2),
            type: CustomPrimaryButtonType.fill,
            // Get.toNamed('/cadastro'),
          ),
        ),
        const SizedBox(height: 42),
        Container(
          child: Card(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Ultimos cadastros',
                          style: TextStyle(
                            fontSize: 19,
                            color: Color(0xFF252733),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 185,
                        height: 32,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          // label:
                          decoration: InputDecoration(
                              alignLabelWithHint: false,
                              // prefixIcon: Icon(Icons.search),
                              labelText: 'Pesqusiar',
                              border: OutlineInputBorder(),
                              // hintText: 'Pesquisar',
                              suffixIcon: Icon(Icons.search)),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // table(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TabelaCarteirasPage(
                      adminPageViewlModel: widget.adminPageViewlModel),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Row(
                    children: [
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            // Get.toNamed('/carteiras');
                            widget.adminPageViewlModel.goToTab(1);
                          },
                          child: const Text(
                            'Ver Todos',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }
}
