import 'package:flutter/material.dart';
import 'package:play_flutter/screens/home_screen.dart';

import '../screens/categories_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://sc04.alicdn.com/kf/H61c24133592b4153a4ba9a02321b35930.jpg')),
            accountName: Text('Hwak'),
            accountEmail: Text('hwak001@gmail.com'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          ListTile(
            title: Text('Categories'),
            leading: Icon(Icons.view_list),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoriesScreen())),
          )
        ],
      )),
    );
  }
}
