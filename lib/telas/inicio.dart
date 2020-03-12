import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/api.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {  
  
  @override
  Widget build(BuildContext context) {

  Api api = Api();
  api.pesquisar("");

    return Container(
      
    );
  }
}