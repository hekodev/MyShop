import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

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
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
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
