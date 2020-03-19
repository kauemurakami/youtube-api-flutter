import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/api.dart';
import 'package:youtube_flutter_app/model/video.dart';

class Inicio extends StatefulWidget {

  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
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
        builder: (context, snapshot){
            switch (snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:

                if(snapshot.hasData){

                  return ListView.separated(
                    itemCount: snapshot.data.length,
                      separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Colors.grey,
                      ),
                      itemBuilder: (context, index){
                        List<Video> videos = snapshot.data;
                        Video video = videos[index];
                        print(video);
                        return Column(
                          children: <Widget>[
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(video.imagem)
                                )
                              ),
                            ),
                            ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.descricao),
                            ),
                          ],
                        );
                      }
                  );
                  }else{
                  Center(
                    child: Text("Nenhum dado a ser exibido")
                  );
                }
                break;
            }
          return Container();
        }

    );
  }
}