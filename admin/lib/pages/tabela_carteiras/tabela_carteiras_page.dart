import 'package:admin/model/user.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TabelaCarteirasPage extends StatefulWidget {
  AdminPageViewlModel adminPageViewlModel;

  TabelaCarteirasPage({Key? key, required this.adminPageViewlModel})
      : super(key: key);

  @override
  State<TabelaCarteirasPage> createState() => _TabelaCarteirasPageState();
}

class _TabelaCarteirasPageState extends State<TabelaCarteirasPage> {


  List<UserModel> listOfAlunos = [];

  @override
  void initState() {
    getAlunos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      rows: List<DataRow>.generate(
          listOfAlunos.length,
              (int index) =>
              createDataRowItem(nome: listOfAlunos[index].nomeCompleto,
                  instituicao: listOfAlunos[index].instituicao,
                  situacao: listOfAlunos[index].ativo,
                  turno: listOfAlunos[index].turno,
                  id : index)
      ),

    );
  }

  createDataRowItem({nome, turno, instituicao, situacao, id}) {
    return DataRow(
      cells: <DataCell>[
        DataCell(Text('$nome',), onTap: () { widget.adminPageViewlModel.controller.selectIndex(4);}),
        DataCell(Text('$turno'), onTap: () {widget.adminPageViewlModel.controller.selectIndex(4);}),
        DataCell(Text('$instituicao'), onTap: () {widget.adminPageViewlModel.controller.selectIndex(4);}),
        DataCell(
          Container(
            width: 100,
            height: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(0xFF29CC97)),
            child: Center(
              child: Text(
                '$situacao',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  getAlunos() async {
//    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection('users').get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.size > 0) {
        querySnapshot.docs.forEach((element) {
          listOfAlunos.add(UserModel.fromJson(element.data()));
        });
        setState(() {

        });
      }
    });
  }
}
