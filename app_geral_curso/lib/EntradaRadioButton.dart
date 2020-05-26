import 'package:flutter/material.dart';

class EntradaRadioButton extends StatefulWidget {
  @override
  _EntradaRadioButtonState createState() => _EntradaRadioButtonState();
}

class _EntradaRadioButtonState extends State<EntradaRadioButton> {

  String _escolhaUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio Button"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RadioListTile(
              title: Text("Masculino"),
              value: "m",
              groupValue: _escolhaUser,
              onChanged: (String value){
                 setState(() {
                   _escolhaUser = value;
                  });
              }
            ),
            RadioListTile(
                title: Text("Feminino"),
                value: "f",
                groupValue: _escolhaUser,
                onChanged: (String value){
                  setState(() {
                    _escolhaUser = value;
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
                  print("Resultado:" + _escolhaUser);
                }
            )

//            Text("Masculino"),
//            Radio(
//                value: "m",
//                groupValue: _escolhaUser,
//                onChanged: (String value){
//                  setState(() {
//                    _escolhaUser = value;
//                  });
//                  print("Resultado:" + value);
//                }
//            ),
//            Text("Feminino"),
//            Radio(
//                value: "f",
//                groupValue: _escolhaUser,
//                onChanged: (String value){
//                  setState(() {
//                    _escolhaUser = value;
//                  });
//                  print("Resultado:" + value);
//                }
//            ),
          ],
        ),
      ),
    );
  }
}
