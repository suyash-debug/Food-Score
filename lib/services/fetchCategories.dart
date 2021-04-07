import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food/models/Categories.dart';

// Fetch our Categories from API
Future<List<Category>> fetchCategories() async {
  const String apiUrl = "https://jsonkeeper.com/b/9SIQ";
  var url = Uri.https('jsonkeeper.com', '/b/9SIQ');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<Category> categories = (json.decode(response.body) as List)
        .map((data) => Category.fromJson(data))
        .toList();
// It retuen list of categories
    return categories;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
