import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:primeiros_passos/widget/drawer.dart';

class BuscaCep extends StatefulWidget {
  @override
  _BuscaCepState createState() => _BuscaCepState();
}

class _BuscaCepState extends State<BuscaCep> {

  final _cepController = TextEditingController(); // Criei um controlador somente para limpar o campo

  String cep;
  String logradouro;
  String bairro;
  String municipio;
  String uf;

  getCep(text) async {
  http.Response response = await http.get("https://viacep.com.br/ws/$text/json"); // Da classe http, fazer a requisição
  Map<String, dynamic> dados = json.decode(response.body); // Transfromei o retorno da requisição em um mapa
  setState(() { // Usei setSatet pois quando pegar os dados do cep, atualizar meus widgets com os dados da requisição
    cep = dados['cep'];
    logradouro = dados['logradouro'];
    bairro = dados['bairro'];
  });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     drawer: DrawerWidget(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){
              _cepController.text = "";
              getCep("01001000");
            },
            icon: Icon(Icons.refresh),
          )
        ],
        title: Text("Buscar CEP"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text("CEP: ${cep == null ? "01001-000" : cep}", 
                      style: TextStyle(
                        fontSize: 20.0, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Logradouro: ${logradouro == null ? "Praça da Sé" : logradouro}", 
                      style: TextStyle(
                        fontSize: 20.0, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Bairro: ${bairro == null ? "Sé" : bairro}", 
                      style: TextStyle(
                        fontSize: 20.0, 
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ),
               Container(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "CEP",
                    labelStyle: TextStyle(fontSize: 20),
                    icon: Icon(Icons.account_circle, size: 40)
                  ),
                  controller: _cepController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onFieldSubmitted: (text){
                    getCep(text);
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