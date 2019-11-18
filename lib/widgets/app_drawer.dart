import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('SHOPNOW'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          buildListTile(
            'Shop',
            Icons.shop,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          buildListTile(
            'Order',
            Icons.payment,
            () {
              // Navigator.of(context)
              //     .pushReplacementNamed(OrdersScreen.routeName);
              Navigator.of(context).pushReplacement(
                CustomRoute(
                  builder: (ctx) => OrdersScreen(),
                ),
              );
            },
          ),
          Divider(),
          buildListTile(
            'Your Products',
            Icons.edit,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          buildListTile(
            'Log Out',
            Icons.exit_to_app,
            () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: tapHandler,
    );
  }
}
