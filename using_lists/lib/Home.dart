import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _items = [];

  void _loadItems(){

    for(int i = 0; i <= 10; i++){

      Map<String, dynamic> item = Map();
      item["Title"] = "Title ${i} Lorem ipsum dolor sit amet.";
      item["Description"] = "Description ${i} Lorem ipsum dolor sit amet.";
      _items.add(item);

    }

  }

  @override
  Widget build(BuildContext context) {

    _loadItems();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lists"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index){

            return ListTile(
                title: Text(_items[index]["Title"]),
                subtitle: Text(_items[index]["Description"]),
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text(_items[index]["Title"]), 
                          titlePadding: EdgeInsets.all(10),
                          titleTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.deepPurple,
                          ),
                          content: Text(_items[index]["Description"]),
                          backgroundColor: Colors.white,
                          actions: <Widget>[
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Yes"),
                                color: Colors.deepPurple,
                            ),
                            FlatButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                                color: Colors.deepPurple,
                            ),
                          ],
                        );
                      },
                  );
                },
                onLongPress: (){

                },
              );
          },
        ),
      ),
    );
  }
}
