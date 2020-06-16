import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _getPosts() async{

    http.Response response =  await http.get(_urlBase+"/posts");
    var jsonData = json.decode(response.body);

    List<Post> posts = List();

    for(var post in jsonData){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      posts.add(p);
    }
    
    return posts;
  }

  _post(){


  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consuming Web Services (Advanced)"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Save"),
                  onPressed: _post,
                )
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _getPosts(),
                builder: (context, snapshot){

                  switch( snapshot.connectionState ){
                    case ConnectionState.none :
                    case ConnectionState.waiting :
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.active :
                    case ConnectionState.done :
                      if( snapshot.hasError ){
                        print("lista: Erro ao carregar ");
                      }else {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index){

                              List<Post> lista = snapshot.data;
                              Post post = lista[index];

                              return ListTile(
                                title: Text( post.title ),
                                subtitle: Text( post.id.toString() ),
                              );

                            }
                        );

                      }
                      break;
                  }

                },
              ),
            )
          ],
        ),
        //Future,
      )
    );
  }
}
