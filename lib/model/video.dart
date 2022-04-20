class Video {

  late String id;
  late String titulo;
  late String descricao;
  late String imagem;
  late String canal;

  Video({this.id="", this.titulo="", this.descricao="", this.imagem="", this.canal=""});

  factory Video.fromJson(Map<String, dynamic> json){ //Factory -> retorno de 1 único objeto
    return Video(
      id: json["id"]["videoId"] ?? "",
      titulo: json["snippet"]["title"] ?? "",
      descricao: json["snippet"]["description"] ?? "",
      imagem: json["snippet"]["thumbnails"]["high"]["url"] ?? "",
      canal: json["snippet"]["channelTitle"] ?? "",
    );
  } 

}