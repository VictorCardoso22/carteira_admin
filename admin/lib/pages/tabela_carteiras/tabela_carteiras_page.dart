import 'package:admin/model/user.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/registro_carteira/registro_carteira_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabelaCarteirasPage extends StatefulWidget {
  AdminPageViewlModel adminPageViewlModel;

  TabelaCarteirasPage({Key? key, required this.adminPageViewlModel})
      : super(key: key);

  @override
  State<TabelaCarteirasPage> createState() => _TabelaCarteirasPageState();
}

class _TabelaCarteirasPageState extends State<TabelaCarteirasPage> {
  // List<UserModel> listOfAlunos = [];

  @override
  void initState() {
    widget.adminPageViewlModel.getAlunos();
    // getAlunos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<UserModel> listOfAlunos = widget.adminPageViewlModel.listOfAlunos;
    return DataTable(
      columnSpacing: 140,
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
              'Turnos',
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
        DataColumn(
          label: Expanded(
            child: Text(
              'Status',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9FA2B4)),
            ),
          ),
        ),
      ],
      rows: listOfAlunos.length > 0
          ? List<DataRow>.generate(
              listOfAlunos.length,
              (int index) => createDataRowItem(
                  nome: listOfAlunos[index].nomeCompleto,
                  instituicao: listOfAlunos[index].instituicao,
                  situacao: listOfAlunos[index].ativo,
                  turno: listOfAlunos[index].turno,
                  id: index))
          : <DataRow>[
              DataRow(
                  cells: List<DataCell>.generate(
                      4, (index) => DataCell(CircularProgressIndicator())))
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
              Container(
                width: 100,
                height: 26,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: situacao == true ? kSuccessColor : kErrorColor),
                child: Center(
                  child: Text(
                    situacao == true ? 'Aprovado' : 'Recusado',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

//   getAlunos() async {
// //    User? user = FirebaseAuth.instance.currentUser;
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     await firestore
//         .collection('users').get()
//         .then((QuerySnapshot querySnapshot) {
//       if (querySnapshot.size > 0) {
//         querySnapshot.docs.forEach((element) {
//           listOfAlunos.add(UserModel.fromJson(element.data()));
//         });
//         setState(() {

//         });
//       }
//     });
//   }
}
