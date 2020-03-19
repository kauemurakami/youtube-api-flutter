import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/custom_search_delegate.dart';
import 'package:youtube_flutter_app/telas/biblioteca.dart';
import 'package:youtube_flutter_app/telas/em_alta.dart';
import 'package:youtube_flutter_app/telas/incricoes.dart';
import 'package:youtube_flutter_app/telas/inicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
          ),
        actions: <Widget>[

          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async{
                String res = await showSearch(context : context, delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res;
                });
              }
          ),
          IconButton(
            icon: Icon(Icons.videocam), 
            onPressed: (){
              print("videocam");
            }
            ),
            IconButton(
            icon: Icon(Icons.account_circle), 
            onPressed: (){
              print("account");
            }
            ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual]),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        currentIndex: _indiceAtual,
        onTap: (index){
          setState(() {
            _indiceAtual = index;
            if(index == 0){
              _resultado = "";
            }
          });
        },
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.greenAccent,
            title: Text("Início"),
            icon: Icon(Icons.home),
            ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.amber[400],
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.lightGreenAccent,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.cyanAccent,
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder),
          ),
        ]
      ),
    );
  }
}