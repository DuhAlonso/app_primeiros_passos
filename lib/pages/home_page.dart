import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _idController = TextEditingController(); // Criei um controlador somente para limpar o campo

  String userName;
  String name;
  String bio;
  String avatarUrl;
  Map date;

  Future<Map> getUser(userName) async { //Usar um Future pois é uma requisição futura
  http.Response response = await http.get("https://api.github.com/users/$userName"); // Da classe http, fazer a requisição
 
  setState(() { // Usei setSatet pois quando pegar os dados do User que atualizar meus widgets com os dados da requisição
    name = json.decode(response.body)["name"]; // Estou dizendo que minhas variaveis vai receber os valores da minha requisição
    bio = json.decode(response.body)["bio"];
    avatarUrl = json.decode(response.body)["avatar_url"];
  });
  return date = json.decode(response.body); // retorno a requisição em formato de mapa
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){
              _idController.text = "";
              getUser("FlutterNation");
            },
            icon: Icon(Icons.refresh),
          )
        ],
        title: Text("Primeiros Passos"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(avatarUrl == null ? "https://scontent-gru2-2.xx.fbcdn.net/v/t1.0-9/p960x960/83980558_1486030458230452_2836173910087565312_o.jpg?_nc_cat=105&_nc_ohc=pKiYqcDx41YAX_39PtD&_nc_ht=scontent-gru2-2.xx&_nc_tp=6&oh=768489424c20e2f19e2c5a0234261608&oe=5ED98322"
                : avatarUrl),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text("Name: ", 
                      style: TextStyle(
                        fontSize: 20.0, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(name == null ? "Flutter Nation" : name, 
                      style: TextStyle(
                        fontSize: 20.0, 
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    Text("Bio: ", 
                      style: TextStyle(
                        fontSize: 20.0, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(bio == null ? name == null ? "Grupo de estudos, focado em Flutter e Dart, "
                    "venham participar e ajudar a comunidade com mais conteúdo o/" : "Null" : bio, 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0, 
                        fontWeight: FontWeight.w300
                      ),
                    )
                  ],
                )
              ),
               Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "User ID",
                    labelStyle: TextStyle(fontSize: 20),
                    icon: Icon(Icons.account_circle, size: 40)
                  ),
                  controller: _idController,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  onFieldSubmitted: (userName){
                    getUser(userName);
                  },
                ),
              )
            ],
          ),
        )
      )
    );
  }
}