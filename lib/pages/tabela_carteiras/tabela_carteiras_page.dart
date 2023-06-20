// import 'package:admin/components/search_bar.dart';
// import 'package:admin/components/search_bar.dart';
import 'package:admin/model/user.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/registro_carteira/registro_carteira_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class TabelaCarteirasPage extends StatefulWidget {
  AdminPageViewlModel adminPageViewlModel;
  TabelaCarteirasPage({Key? key, required this.adminPageViewlModel})
      : super(key: key);

  @override
  State<TabelaCarteirasPage> createState() => _TabelaCarteirasPageState();
}

class _TabelaCarteirasPageState extends State<TabelaCarteirasPage> {
  TextEditingController textEditingController = new TextEditingController();
  String filter = "";
  bool itemFilter = true;
  bool aprovado = false;
  bool pendente = false;
  bool todos = true;

  @override
  void initState() {
    widget.adminPageViewlModel.getAlunos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<UserModel> listOfAlunos = widget.adminPageViewlModel.listOfAlunos;
    List<UserModel> listFiltrada = widget.adminPageViewlModel.listFiltradaNome;
    List<UserModel> listAprovados =
        widget.adminPageViewlModel.listOfAlunosAtivos;
    List<UserModel> listPendentes =
        widget.adminPageViewlModel.listOfAlunosInativos;

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Scaffold(
            appBar: EasySearchBar(
              isFloating: true,
              title: const Text(''),
              leading: null,
              searchHintText: 'Pesquisar por nome',
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
          child: SizedBox(
            child: DataTable(
                columnSpacing: 50,
                columns: <DataColumn>[
                  const DataColumn(
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
                  const DataColumn(
                    label: Expanded(
                      child: Text(
                        'Turnos',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9FA2B4)),
                      ),
                    ),
                  ),
                  const DataColumn(
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
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          InkWell(
                            child: Container(
                                height: 38,
                                padding: const EdgeInsets.only(
                                    left: 18, right: 12, bottom: 4, top: 4),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                  ),
                                  color: todos == true
                                      ? kPrimaryContainerColor
                                      : kPrimaryLightColor,
                                ),
                                child: Center(
                                    child: Text(
                                  'Todos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: todos == true
                                          ? kPrimaryLightColor
                                          : kOnPrimaryLightColor),
                                ))),
                            onTap: () {
                              setState(() {
                                todos = true;
                                aprovado = false;
                                pendente = false;
                              });
                            },
                          ),
                          InkWell(
                            child: Container(
                                height: 38,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 08),
                                decoration: BoxDecoration(
                                  color: aprovado == true
                                      ? kPrimaryContainerColor
                                      : kPrimaryLightColor,
                                ),
                                child: Center(
                                    child: Text('Aprovados',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: aprovado == true
                                                ? kPrimaryLightColor
                                                : kOnPrimaryLightColor)))),
                            onTap: () {
                              setState(() {
                                todos = false;
                                aprovado = true;
                                pendente = false;
                              });
                            },
                          ),
                          InkWell(
                            child: Container(
                                height: 38,
                                padding: const EdgeInsets.only(
                                    left: 12, right: 18, bottom: 4, top: 4),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  color: pendente == true
                                      ? kPrimaryContainerColor
                                      : kPrimaryLightColor,
                                ),
                                child: Center(
                                    child: Text('Pendentes',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: pendente == true
                                                ? kPrimaryLightColor
                                                : kOnPrimaryLightColor)))),
                            onTap: () {
                              todos = false;
                              aprovado = false;
                              pendente = true;

                              setState(() {});
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                rows: () {
                  if (filter == "") {
                    if (pendente == true) {
                      setState(() {});
                      return listPendentes.isNotEmpty
                          ? List<DataRow>.generate(listPendentes.length,
                              (int index) {
                              setState(() {});
                              return createDataRowItem(
                                nome: listPendentes[index].nomeCompleto,
                                instituicao: listPendentes[index].instituicao,
                                situacao: listPendentes[index].ativo,
                                turno: listPendentes[index].turno,
                                id: index,
                              );
                            })
                          : <DataRow>[
                              DataRow(
                                  cells: List<DataCell>.generate(
                                      4,
                                      (index) => const DataCell(
                                          CircularProgressIndicator())))
                            ];
                    } else if (aprovado == true) {
                      setState(() {});
                      return listAprovados.isNotEmpty
                          ? List<DataRow>.generate(listAprovados.length,
                              (int index) {
                              setState(() {});
                              return createDataRowItem(
                                nome: listAprovados[index].nomeCompleto,
                                instituicao: listAprovados[index].instituicao,
                                situacao: listAprovados[index].ativo,
                                turno: listAprovados[index].turno,
                                id: index,
                              );
                            })
                          : <DataRow>[
                              DataRow(
                                  cells: List<DataCell>.generate(
                                      4,
                                      (index) => const DataCell(
                                          CircularProgressIndicator())))
                            ];
                    } else if (todos == true) {
                      return listOfAlunos.isNotEmpty
                          ? List<DataRow>.generate(listOfAlunos.length,
                              (int index) {
                              setState(() {});
                              return createDataRowItem(
                                nome: listOfAlunos[index].nomeCompleto,
                                instituicao: listOfAlunos[index].instituicao,
                                situacao: listOfAlunos[index].ativo,
                                turno: listOfAlunos[index].turno,
                                id: index,
                              );
                            })
                          : <DataRow>[
                              DataRow(
                                  cells: List<DataCell>.generate(
                                      4,
                                      (index) => const DataCell(
                                          CircularProgressIndicator())))
                            ];
                    } else {
                      return <DataRow>[
                        DataRow(
                            cells: List<DataCell>.generate(
                                4,
                                (index) => const DataCell(
                                    CircularProgressIndicator())))
                      ];
                    }
                  } else {
                    return List<DataRow>.generate(listFiltrada.length,
                        (int index) {
                      return createDataRowItem(
                        nome: listFiltrada[index].nomeCompleto,
                        instituicao: listFiltrada[index].instituicao,
                        situacao: listFiltrada[index].ativo,
                        turno: listFiltrada[index].turno,
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
        4,
        (index) {
          if (index < 3) {
            return DataCell(Text(
              () {
                switch (index) {
                  case 0:
                    {
                      return "$nome";
                    }
                  case 1:
                    {
                      return "$turno";
                    }
                  case 2:
                    {
                      return "$instituicao";
                    }
                  default:
                    {
                      return "";
                    }
                    break;
                }
              }(),
            ), onTap: () {
              Get.to(RegistroCarteiraPage(
                user: widget.adminPageViewlModel.listOfAlunos[id],
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
                      situacao == true ? 'Aprovado' : 'Pendente',
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
    widget.adminPageViewlModel.listOfAlunos.forEach((element) {
      itemFilter =
          element.nomeCompleto!.toLowerCase().contains(filter.toLowerCase());
      if (itemFilter) {
        widget.adminPageViewlModel.listFiltradaNome.add(element);
      }
    });
  }
}
