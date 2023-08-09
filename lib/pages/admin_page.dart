import 'package:admin/components/menu_sidebar.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/pages/topo_page/topo_page.dart';
import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminPageViewlModel>.reactive(
        viewModelBuilder: () => AdminPageViewlModel(context),
        builder: (context, model, child) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            drawer: MenuSidebarX(controller: model.controller),
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: kPrimaryLightColor,
                    leading: IconButton(
                      onPressed: () {
                        model.controller.setExtended(true);
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            body: Column(
              children: [
                 TopoPage(),
                // MENU LATERAL
                Flexible(
                  child: Row(
                    children: [
                      // SIDEBAR
                      if (!isSmallScreen)
                        MenuSidebarX(controller: model.controller),
                      //SIDEBAR
                      // Container das telas
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 20),
                          // COMPONENTES DO CORPO, TELAS CHAMADAS PELO MENU
                          child: Screens(
                            controller: model.controller,
                            adminPageViewlModel: model,
                          ),
                        ),
                      ),
                      //Container das telas
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
