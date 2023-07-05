import 'package:admin/components/custom_card.dart';
import 'package:admin/components/custom_primary_button.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/tabela_carteiras/tabela_carteiras_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  AdminPageViewlModel adminPageViewlModel;
  HomePageState? homePageState;
  HomePage({super.key, required this.adminPageViewlModel});

  @override
  State<HomePage> createState() {
    homePageState = HomePageState();
    return homePageState!;
  }
}

class HomePageState extends State<HomePage> {
  List<ListCadastros> getCadastros() {
    final List<ListCadastros> listCadastros = [
      ListCadastros(
          'Aprovadas', widget.adminPageViewlModel.ativos, kPrimaryLightColor),
      ListCadastros(
          'Pendentes', widget.adminPageViewlModel.inativos, kSecondaryColor)
    ];
    setState(() {});
    return listCadastros;
  }

  @override
  void initState() {
    getCadastros();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 22,
              color: Color(0xFF252733),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 55),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 10,
              children: [
                Column(
                  children: [
                    CustomCard(
                      titulo: 'Carteiras cadastradas',
                      valor:
                          '${widget.adminPageViewlModel.listOfAlunos.length}',
                    ),
                    const SizedBox(height: 16),
                    CustomCard(
                        titulo: 'Carteiras aprovadas',
                        valor: '${widget.adminPageViewlModel.ativos}'),
                    const SizedBox(height: 16),
                    CustomCard(
                      titulo: 'Carteiras pendentes',
                      valor: '${widget.adminPageViewlModel.inativos}',
                    ),
                  ],
                ),
                const SizedBox(width: 42),
                SizedBox(
                  width: 400,
                  height: 400,
                  child: SfCircularChart(
                    // title: ChartTitle(text: 'Sales by sales person'),
                    legend: Legend(isVisible: true),
                    series: <CircularSeries>[
                      PieSeries<ListCadastros, String>(
                          explode: true,
                          explodeIndex: 0,
                          strokeColor: kPrimaryLightColor,
                          pointColorMapper: (ListCadastros data, _) =>
                              data.color,
                          dataSource: getCadastros(),
                          xValueMapper: (ListCadastros data, _) => data.status,
                          yValueMapper: (ListCadastros data, _) => data.qtd,
                          // dataLabelMapper: (ListCadastros data, _) => data.text,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true)),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
        Card(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                child: Row(
                  children: [
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
                    // SizedBox(
                    //   width: 185,
                    //   height: 32,
                    //   child: TextField(
                    //     textAlignVertical: TextAlignVertical.center,
                    //     // label:
                    //     decoration: InputDecoration(
                    //         alignLabelWithHint: false,
                    //         // prefixIcon: Icon(Icons.search),
                    //         labelText: 'Pesqusiar',
                    //         border: OutlineInputBorder(),
                    //         // hintText: 'Pesquisar',
                    //         suffixIcon: Icon(Icons.search)),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const Divider(),
              // table(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TabelaCarteirasPage(
                    adminPageViewlModel: widget.adminPageViewlModel,
                    tamanho: 10),
              ),
              const Divider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
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
        const SizedBox(height: 55),
      ],
    );
  }
}

class ListCadastros {
  ListCadastros(this.status, this.qtd, [this.color]);
  final String status;
  final int qtd;
  Color? color;
}
