import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe_model.dart';

class ApiService {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  static Future<List<Recipe>> getRecipes(String category) async {
    final response =
        await http.get(Uri.parse('${_baseUrl}filter.php?c=$category'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> meals = data['meals'];
      return meals.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data resep.');
    }
  }
}
