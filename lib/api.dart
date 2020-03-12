import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyD1-aMW6fZqP3WpLTd6PsEb31H1ZqkTd7I";
const ID_CHANNEL = "UCwXdFgeE9KYzlDdR7TG9cMw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Api();

  pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&channelId=$ID_CHANNEL"
      "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      //print(response.body);
      Map<String,dynamic> dadosJson = json.decode(response.body);

    }else{

    }
  }

}