import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/video.dart'; 

const API_KEY = "AIzaSyAjsfsXGjq8ZKuPGXPap5IgMgZVBTolBag";
const ID_CHANNEL = "UCwXdFgeE9KYzlDdR7TG9cMw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Api();

   Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$API_KEY"
      "&channelId=$ID_CHANNEL"
      "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      
      //videos
      Map<String,dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();
      return videos;

    }else{

    }
  }

}