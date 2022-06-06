import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/dashboard/components/sidebar.dart';

import 'components/dashboardscreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBar(),
        body: SafeArea(
          child: Row(children: const [
            Expanded(child: SideBar()),
            Expanded(flex: 5, child: DashboardScreen()),
          ]),
        ));
  }
}
