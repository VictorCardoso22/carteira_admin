// import 'package:admin/components/search_bar.dart';
// import 'package:admin/components/search_bar.dart';
import 'package:admin/model/user.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/registro_carteira/registro_carteira_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

enum TabelaCarteirasTurnoType { matutino, vespertino, noturno }

class TabelaCarteirasTurno extends StatefulWidget {
  AdminPageViewlModel adminPageViewlModel;
  int? tamanho;
  List<UserModel> listTurno;

  TabelaCarteirasTurno({
    Key? key,
    required this.adminPageViewlModel,
    this.tamanho,
    required this.listTurno,
  }) : super(key: key);

  @override
  State<TabelaCarteirasTurno> createState() => _TabelaCarteirasTurnoState();
}

class _TabelaCarteirasTurnoState extends State<TabelaCarteirasTurno> {
  TextEditingController textEditingController = TextEditingController();
  String filter = "";
  bool itemFilter = true;
  List<UserModel>? listToAluno;

  @override
  void initState() {
    // widget.adminPageViewlModel.getAlunos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<UserModel> listOfAlunos = widget.listTurno;
    List<UserModel> listFiltrada = widget.adminPageViewlModel.listFiltradaNome;

    if (filter != "") {
      listToAluno = listFiltrada;
    } else {
      listToAluno = listOfAlunos;
    }

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Scaffold(
            appBar: EasySearchBar(
              isFloating: true,
              title: Container(
                  alignment: Alignment.centerRight, child: const Text('')),
              leading: null,
              searchHintText: 'Pesquisar por nome ou instituição de ensino',
              elevation: 0,
              iconTheme: null,
              backgroundColor: kOnPrimaryLightColor,
              foregroundColor: kBackgroundDarkColor,
              onSearch: (value) => setState(() {
                geraListFiltrada();
                filter = value;
              }),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500, minWidth: 400),
            // width: MediaQuery.of(context).size.width * 0.8,
            child: DataTable(
                columnSpacing: 20,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Nome',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9FA2B4)),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Instituição de ensino',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9FA2B4)),
                      ),
                    ),
                  ),
                ],
                rows: () {
                  if (filter == "") {
                    return listOfAlunos.isNotEmpty
                        ? List<DataRow>.generate(listOfAlunos.length,
                            (int index) {
                            setState(() {});
                            return createDataRowItem(
                              nome: listOfAlunos[index].nomeCompleto,
                              instituicao: listOfAlunos[index].instituicao,
                              situacao: listOfAlunos[index].ativo,
                              // turno: listOfAlunos[index].turno,
                              id: index,
                            );
                          }).sublist(
                            0,
                            (widget.tamanho != null &&
                                    widget.tamanho! <= listOfAlunos.length)
                                ? widget.tamanho
                                : listOfAlunos.length)
                        : <DataRow>[
                            DataRow(
                                cells: List<DataCell>.generate(
                                    2,
                                    (index) => const DataCell(
                                        CircularProgressIndicator())))
                          ];
                  } else {
                    return List<DataRow>.generate(listFiltrada.length,
                        (int index) {
                      return createDataRowItem(
                        nome: listFiltrada[index].nomeCompleto,
                        instituicao: listFiltrada[index].instituicao,
                        situacao: listFiltrada[index].ativo,
                        // turno: listFiltrada[index].turno,
                        id: index,
                      );
                    });
                  }
                }()),
          ),
        ),
      ],
    );
  }

  createDataRowItem({nome, turno, instituicao, situacao, id}) {
    return DataRow(
      cells: List<DataCell>.generate(
        2,
        (index) {
          if (index < 2) {
            return DataCell(Text(
              () {
                switch (index) {
                  case 0:
                    {
                      return "$nome";
                    }
                  case 1:
                    {
                      return "$instituicao";
                    }

                  default:
                    {
                      return "";
                    }
                }
              }(),
            ), onTap: () {
              Get.to(RegistroCarteiraPage(
                user: listToAluno![id],
              ))!
                  .then((value) {
                setState(() {
                  widget.adminPageViewlModel.getAlunos();
                });
              });
            });
          } else {
            return DataCell(
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    situacao == true
                        ? const Icon(
                            Icons.check,
                            color: kSuccessColor,
                          )
                        : const Icon(
                            Icons.clear,
                            color: kErrorColor,
                          ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      situacao == true ? 'Aprovada' : 'Pendente',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color:
                              situacao == true ? kSuccessColor : kErrorColor),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  geraListFiltrada() {
    widget.adminPageViewlModel.listFiltradaNome.clear();
    for (var element in widget.adminPageViewlModel.listOfAlunos) {
      itemFilter =
          element.nomeCompleto!.toLowerCase().contains(filter.toLowerCase()) ||
              element.instituicao!.toLowerCase().contains(filter.toLowerCase());
      if (itemFilter) {
        widget.adminPageViewlModel.listFiltradaNome.add(element);
      }
    }
  }
}
