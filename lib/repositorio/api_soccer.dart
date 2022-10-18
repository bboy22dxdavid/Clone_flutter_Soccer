// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unnecessary_brace_in_string_interps, missing_return
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelos/soccer_match.dart';

class ApiSoccer{
  //variáveis da URL do endpoint p/ obter os dados de api-sport.io
   final Uri  apiUrl = Uri.parse('https://api-football-v1.p.rapidapi.com/v3/timezone');
  static const headers = {
      'X-RapidAPI-Key': "2d98c83e75mshbb4857487f6914cp17be05jsn2ce0fecc5fe6",
      'X-RapidAPI-Host': 'api-football-v1.p.rapidapi.com'
    };
  // método modelo
  Future<List<SoccerMatch>> getAllMatches() async {
    var res = await http.get(apiUrl, headers: headers);
    http.Response response = await http.get(apiUrl);
    print(response.body);

    var body;

    if (res.statusCode == 200) {
      print(res.statusCode );
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    }
  }
}
