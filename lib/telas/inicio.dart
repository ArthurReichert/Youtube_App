import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube_app/api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_app/videoview.dart';
import '../model/video.dart';

class Inicio extends StatefulWidget {

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesquisa){

    Api api = Api();
    return api.pesquisar(pesquisa);

  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot){ //O snapshot "escuta o FutureBuilder"
        switch(snapshot.connectionState){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return Center(
                child: CircularProgressIndicator(),
              );
            break;
          case ConnectionState.active :
          case ConnectionState.done :
            if(snapshot.hasData){
              
              return ListView.separated(
                itemBuilder: (context, index){

                  List<Video>? videos = snapshot.data; //Recupera a nossa lista de vídeos (e coloca no snapshot)
                  Video video = videos![index]; //Recupera os vídeos baseado no índice

                  return GestureDetector(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE_API,
                        videoId: video.id
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration( //Imagem q vai ficar ao fundo
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem) //Recupera a imagem de fundo
                              
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        )
                      ],
                    ),
                  );
                }, 
                separatorBuilder: (context, index) => Divider( //Coloca um separador entre os itens
                  height: 2, 
                  color: Colors.grey,
                ), 
                itemCount: snapshot.data!.length
              );

            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            break;
        }
      },
    );

  }
}

