import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/tabela_carteiras/tabela_carteiras_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CarteirasPage extends StatefulWidget {
  AdminPageViewlModel adminPageViewlModel;
  CarteirasPage({Key? key, required this.adminPageViewlModel})
      : super(key: key);

  @override
  State<CarteirasPage> createState() => _CarteirasPageState();
}

class _CarteirasPageState extends State<CarteirasPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Carteiras cadastradas',
          style: TextStyle(
              fontSize: 24,
              color: Color(0xFF252733),
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 55),
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
              ],
            ),
          ),
        ),
        const SizedBox(height: 55),
      ],
    );
  }
}
