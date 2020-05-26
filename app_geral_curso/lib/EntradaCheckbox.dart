import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _brFood = false;
  bool _mxFood = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

            CheckboxListTile(
                title: Text("Comida Brasileira"),
                subtitle: Text("teste"),
                secondary: Icon(Icons.add_box),
                //activeColor: Colors.amber,
                value: _brFood,
                onChanged: (bool value){
                  setState(() {
                    _brFood = value;
                  });
                }
            ),
            CheckboxListTile(
                title: Text("Comida Mexicana"),
                subtitle: Text("teste"),
                secondary: Icon(Icons.add_box),
                //activeColor: Colors.amber,
                value: _mxFood,
                onChanged: (bool value){
                  setState(() {
                    _mxFood = value;
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
                  print("Pelé");
                }
            )

//            Text("Comida Brasileira"),
//            Checkbox(
//              value: _is_checked,
//              onChanged: (bool value){
//                setState(() {
//                  _is_checked = value;
//                });
//              },
//            )
          ],
        ),
      ),
    );
  }
}
