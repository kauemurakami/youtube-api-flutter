class Video{

  String id;
  String titulo;
  String imagem;
  String canal;
  String descricao;

  Video({this.id, this.titulo, this.imagem, this.canal, this.descricao});
/*
  static convertJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbails"]["high"]["url"],
      canal: json["snippet"]["channel"],
      descricao: json["snippet"]["description"]
    );
  }
*/
  //funciona como static mas o retorno é de um único objeto, criando uma única instancia do construtor
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["id"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
      descricao: json["snippet"]["description"]
    );
  }

  toJson(){

  }
}