import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_apis/model/post_model.dart';

class ProviderService {
  getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode==200) {
      final json = jsonDecode(response.body) as List;
      final post = json.map((e) => Post(
        id: e['id'],
        userId: e['userId'],
        title: e['title'],
        body: e['body']
      )).toList();
      return post;
    }
    return [];
  }

  postMethod(var body)async {
    const url = 'example.com';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
      body:json.decode(body) ,
    );
    if(response.statusCode ==200){
      return response.body;
    }

  }
}