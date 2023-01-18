import 'package:admin/components/custom_card.dart';
import 'package:admin/components/custom_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              valor: '60',
            ),
            CustomCard(
              titulo: 'Carteiras aprovadas',
              valor: '16',
            ),
            CustomCard(
              titulo: 'Carteiras pendentes',
              valor: '43',
            ),
          ],
        ),
        const SizedBox(height: 55),
        Container(
          child: Card(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
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
                const Divider(),
                table(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget table() {
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
          cells: <DataCell>[
            DataCell(Text('Joao Victor Cardoso de Santana')),
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
