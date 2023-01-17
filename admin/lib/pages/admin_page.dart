import 'package:admin/components/menu_sidebar.dart';
import 'package:admin/pages/admin_page_viewmodel.dart';
import 'package:admin/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stacked/stacked.dart';

class AdminPage extends StatefulWidget {
  AdminPage({Key? key}) : super(key: key);
  final _key = GlobalKey<ScaffoldState>();
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminPageViewlModel>.reactive(
        viewModelBuilder: () => AdminPageViewlModel(context),
        builder: (context, model, child) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: widget._key,
            drawer: MenuSidebarX(controller: model.controller),
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: kPrimaryLightColor,
                    leading: IconButton(
                      onPressed: () {
                        model.controller.setExtended(true);
                        widget._key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            body: Container(
              color: kBackgroundLightColor,
              child: Column(
                children: [
                  // Topo(),
                  // MENU LATERAL
                  Flexible(
                    child: Row(
                      children: [
                        // SIDEBAR
                        if (!isSmallScreen)
                          MenuSidebarX(controller: model.controller),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 20),
                            // COMPONENTES DO CORPO, TELAS CHAMADAS PELO MENU
                            child: Screens(
                              controller: model.controller,
                              adminPageViewlModel: model,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
