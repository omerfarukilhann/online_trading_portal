import 'package:flutter/material.dart';
import 'package:online_trading_portal/widgets/addProduct.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
          ),
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            radius: 100,
            backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
          ),
          SizedBox(height: 12),
          Text('  Omer Faruk Ilhan  ',
              style: TextStyle(fontSize: 28, color: Colors.black)),
          Text('  omerfaruk.ilhan@agu.edu.tr  ',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('username'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: Text('Add product'),
            onTap: () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => add_product(),
            )),
          ),
          ListTile(
            leading: const Icon(Icons.add_chart_outlined),
            title: Text('Transaction History'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
