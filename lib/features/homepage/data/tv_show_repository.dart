import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviemuse/features/homepage/data/tv_show_model.dart';

class TVShowRepository {
  final String apiUrl = 'https://www.episodate.com/api/most-popular?page=1';

  Future<List<TVShowModel>> fetchTVShows() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['tv_shows'] as List)
          .map((show) => TVShowModel.fromJson(show))
          .toList();
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}
