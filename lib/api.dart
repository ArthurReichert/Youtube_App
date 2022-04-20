import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBvINfuzhnzOnaghHhrM6cYK06FXiIP4Ss";
const ID_CANAL = "UCsDdKiAM6u-T-UdrLFuMztA";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async{

    var url = Uri.parse(
      URL_BASE + "search"
      "?part=snippet" //Somente o 1 parâmetro vai ?
      "&type=video" //A partir daqui é só usado o &
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&channelId=$ID_CANAL"
      "&q=$pesquisa"
    );
    http.Response response;

    response = await http.get(url);

    if(response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode(response.body); //Converte o Json para um Map

      List<Video> videos = dadosJson["items"].map<Video>( //Percorre dentro do items os objetos do tipo video
        (map){ //Recebe o map (objeto video)

          return Video.fromJson(map); //Converte o map para um objeto do tipo video

        }
      ).toList();

      return videos;

    }else{

    }

    return pesquisar(pesquisa);

  }

}