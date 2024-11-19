import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/post_model.dart';

class ApiServiceBola {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> teams = json['teams'];
      return teams.map((teams) => PostModel.fromJson(teams)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}