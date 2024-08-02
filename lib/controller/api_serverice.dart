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





  Future<void> fetchDetailsData(int id) async {
    final url = 'https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
        Publiccontroller.pc.itemData.value = json.decode(response.body);

    } else {
      // Handle the error appropriately here



      throw Exception('Failed to load data');
    }
  }
}
