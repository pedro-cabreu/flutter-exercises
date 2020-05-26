import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  @override
  _EntradaSwitchState createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _option = false;
  bool _config = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            
            SwitchListTile(
              title: Text("Receber notificações?"),
              value: _option,
              onChanged: (bool value) {
                setState(() {
                  _option = value;
                });
              }
            ),
            SwitchListTile(
                title: Text("Carregar Automaticamente"),
                value: _config,
                onChanged: (bool value) {
                  setState(() {
                    _config = value;
                  });
                }
            ),
            RaisedButton(
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                onPressed: (){
                  print("Resultado:" + _option.toString());
                }
            )

//              Switch(
//                  value: _option,
//                  onChanged: (bool value){
//                    setState(() {
//                      _option = value;
//                    });
//                  }
//              ),
            ],
        ),
      ),
    );
  }
}
