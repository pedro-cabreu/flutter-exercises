import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCEP = TextEditingController();
  String _result = "Resultado";

  void _getCEP() async{

    String cep = _controllerCEP.text;
    String url = "https://viacep.com.br/ws/$cep/json/";
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String localidade = retorno["localidade"];
    String bairro = retorno["bairro"];

    setState(() {
      _result = "$logradouro, $bairro, $localidade";
    });

    print(
      "Resposta: Logradouro:$logradouro, Localidade: $localidade, Bairro: $bairro"
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Consultar CEP",
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Entre com o CEP ex:13870000"
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: _controllerCEP,
            ),
            RaisedButton(
              child: Text("Pesquisar"),
                onPressed: _getCEP,
            ),
            Text(
              "Resultado: $_result",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
