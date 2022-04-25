import 'dart:convert';

import 'package:http/http.dart' as client;

import '../model/news.dart';

class ApiSengkaki{
  final String baseUrl = 'https://api-sengkaki-expressjs.vercel.app';
  final Map<String, String> header = {"Content-Type": "application/json"};
  final uri = 'api-sengkaki-expressjs.vercel.app/all/0';

  Future<List<News>> getAllNews({required String select,required int limit}) async{
    final response = await client.get(Uri.parse('$baseUrl/api/v1/news/$select/$limit'), headers: header);
    if(response.statusCode == 200){
      return newsFromJson(response.body);
    }else{
      return [];
    }
  }

  Future<Map> getNewsById({required String id}) async {
    final response = await client.get(Uri.parse('$baseUrl/api/v1/news/$id'), headers: header);
    var decodeData = json.decode(response.body);
    if(response.statusCode == 200){
      return { 
        "status": decodeData["status"],
        "data": News.formJson(decodeData["data"])
      };
    }else{
      return {
        "status": decodeData["status"],
        "message": decodeData["message"],
      };
    }
  }
}