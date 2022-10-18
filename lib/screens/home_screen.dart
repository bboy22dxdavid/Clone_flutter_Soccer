// ignore_for_file: avoid_print

import 'package:clone_flutter_soccer/screens/screnn_body.dart';
import 'package:flutter/material.dart';
import '../repositorio/api_soccer.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0.0,
          title: const Text( "TABELA DE JOGOS",
            style: TextStyle(color: Colors.black),
          ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiSoccer().getAllMatches(),
        builder: (context, snapshot){
          if( snapshot.hasData){
            print(snapshot.data);
            return ScreenBody(snapshot.data);
          }else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}
