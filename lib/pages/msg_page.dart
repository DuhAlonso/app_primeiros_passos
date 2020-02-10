import 'package:flutter/material.dart';

class MsgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Msg"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text(
          "Você está em outra página",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        )
      ),
    );
  }
}