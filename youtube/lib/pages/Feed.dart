import 'package:flutter/material.dart';
import 'package:youtube/API.dart';
import 'package:youtube/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Feed extends StatefulWidget {

  String search;
  Feed(this.search);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {

  _listVideos(String q){
    Future<List<Video>> videos;

    API api = API();

    return api.search(q);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listVideos(widget.search),
      // ignore: missing_return
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                  itemBuilder: (context, index){

                    List<Video> videos = snapshot.data;
                    Video video = videos[ index ];

                    return GestureDetector(
                      onTap: (){
                        FlutterYoutube.playYoutubeVideoById(apiKey: api_key, videoId: video.id, autoPlay: true, fullScreen: true);
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(video.image),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          ListTile(
                            title: Text(video.title),
                            subtitle: Text(video.channel),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 10,
                    color: Colors.grey,
                  ),
                  itemCount: snapshot.data.length);
            }else{
              return Center(
                child: Text("Error"),
              );
            }
            break;
        }
      },
    );
  }
}
