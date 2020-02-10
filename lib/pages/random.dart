import 'package:flutter/material.dart';
import 'package:primeiros_passos/pages/msg_page.dart';
import 'dart:math';
import 'package:primeiros_passos/widget/drawer.dart';

class RandomPage extends StatefulWidget {
  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {

  String randomScreen = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text("Random"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(randomScreen == "0" ? "Pense em um número e clique no botão." : randomScreen,
              textAlign: TextAlign.center,
                style: TextStyle(fontSize: randomScreen == "0" ? 30 : 40),
              ),
              SizedBox(height: 15, width: 15),
              RaisedButton(
                color: Colors.deepPurple,
                onPressed: (){
                  setState(() {
                    randomScreen = randomNumber();
                  });
                },
                child: Text("Go", 
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              RaisedButton(
                color: Colors.deepPurple,
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MsgPage())
                  );
                },
                child: Text("Page Msg", 
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }

   String randomNumber(){
    var number = Random();
    int min = 1;
    int max = 10;
    var numberRandom = min + number.nextInt(max - min);
    return numberRandom.toString();
  }

}