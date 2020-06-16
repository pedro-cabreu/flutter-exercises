import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const api_key = 'AIzaSyDnE7mdrL9mAtMAMpCsGQ-Xam4HCS2aI8g';
const channel_key = 'UCyabCqc2M3J9HItEroLOTvA';
const base_url = 'https://www.googleapis.com/youtube/v3/';

class API{

  Future<List<Video>> search( String search ) async {

    http.Response response = await http.get(
      base_url + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=viewCount"
          "&key=$api_key"
          "&channelId=$channel_key"
          "&q=$search"
    );

    if( response.statusCode == 200){

      Map<String, dynamic> jsonData = json.decode(response.body);

      List<Video> videos = jsonData["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      return videos;
    }

  }

}