import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:flutter/material.dart';

class TabelaCarteirasPage extends StatefulWidget {
  AdminPageViewlModel adminPageViewlModel;
  TabelaCarteirasPage({Key? key, required this.adminPageViewlModel})
      : super(key: key);

  @override
  State<TabelaCarteirasPage> createState() => _TabelaCarteirasPageState();
}

class _TabelaCarteirasPageState extends State<TabelaCarteirasPage> {
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
      rows: <DataRow>[
        DataRow(
          onLongPress: () {
            print('Primeiro');
            widget.adminPageViewlModel.goToTab(4);
          },
          cells: <DataCell>[
            DataCell(
                Text(
                  'Joao Victor Cardoso de Santana',
                ), onTap: () {
              print('Primeiro');
              widget.adminPageViewlModel.goToTab(4);
            }),
            DataCell(Text('Noturno')),
            DataCell(Text('Uncisal')),
            DataCell(
              Container(
                width: 100,
                height: 26,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFF29CC97)),
                child: Center(
                  child: Text(
                    'Aprovado',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        DataRow(
          onLongPress: () {},
          cells: <DataCell>[
            DataCell(Text('Maria dos santos da silva')),
            DataCell(Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Matutino'),
                Text('Vespertino'),
              ],
            )),
            DataCell(Text('Cesmac')),
            DataCell(
              Container(
                width: 100,
                height: 26,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFFF12B2C)),
                child: Center(
                  child: Text(
                    'Pendente',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Joao jose da silva santos')),
            DataCell(Text('Vespertino')),
            DataCell(Text('Ufal')),
            DataCell(Container(
              width: 100,
              height: 26,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFFF12B2C)),
              child: Center(
                child: Text(
                  'Pendente',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
