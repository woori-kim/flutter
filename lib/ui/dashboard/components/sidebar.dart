import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          ListTile(
            title: const Text("Dashboard"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Dashboard'), duration: Duration(milliseconds: 500)));
            },
          ),
          ListTile(
            title: const Text("Command"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Command'), duration: Duration(milliseconds: 500)));
            },
          ),
          ListTile(
            title: const Text("Log"),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Log'),
                duration: Duration(milliseconds: 500),
              ));
            },
          ),
        ],
      ),
    );
  }
}
