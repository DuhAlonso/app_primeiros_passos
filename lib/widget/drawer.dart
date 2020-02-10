import 'package:flutter/material.dart';
import 'package:primeiros_passos/pages/home_page.dart';
import 'package:primeiros_passos/pages/random.dart';

  class DrawerWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Primeiros Passos\ncom Flutter', 
              style: TextStyle(fontSize: 30, color: Colors.white)),
            decoration: BoxDecoration(
              color: Color(0xFF5303AD),
            ),
          ),
          ListTile(
            title: Text('Search User'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HomePage())
              );
            },
          ),
          ListTile(
            title: Text('Random Number'),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => RandomPage())
              );
            },
          ),
        ],
      ),
    );
    }
  }