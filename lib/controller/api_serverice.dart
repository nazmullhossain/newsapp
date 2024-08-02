import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsapp/controller/publicController.dart';

class ApiServerice {
  Future<void> fetchTopStories() async {
    final response = await http.get(
        Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json'));
    if (response.statusCode == 200) {
      Publiccontroller.pc.topStories = json.decode(response.body);
      print(response.body);
    } else {
      throw Exception('Failed to load top stories');
    }
  }





  Future<Map<String, dynamic>> fetchItem(int id) async {
    final response = await http.get(
      Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load item');
    }
  }
}
