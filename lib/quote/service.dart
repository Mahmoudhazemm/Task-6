
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_taskone/quote/quote.dart';


Future <List<Quote>> fetchQuote () async{

  final response =await http.get(Uri.parse("https://api.api-ninjas.com/v1/quotes"),
    headers: {
      'X-Api-Key': 'YiDWt0jlWXkMZsN7HYjUNA==qsjc7zOUnyphPQ5l'
    },
  );
  if (response.statusCode==200){

    List <dynamic> data = jsonDecode(response.body);

    return data.map((json)=>Quote.fromJson(json)).toList();
  }

  throw Exception("failed to load data");

}