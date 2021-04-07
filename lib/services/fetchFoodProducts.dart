import 'dart:convert';
import 'package:food/models/FoodProducts.dart';
import 'package:http/http.dart' as http;

abstract class FoodProductRepository {
  /// Throws [NetworkException].
  Future<List<FoodProduct>> fetchProducts();
}

class ProductRepository implements FoodProductRepository {
  // Fetch our Products from API
  @override
  Future<List<FoodProduct>> fetchProducts() async {
    const String apiUrl = "https://jsonkeeper.com/b/TNS2";

    var url = Uri.https('jsonkeeper.com', '/b/TNS2', {'q': '{http}'});

    final response = await http.get(url);
    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> data = json.decode(response.body);
      // var data = response.body;
      // print(data.runtimeType);
      // print(data);
      List<FoodProduct> foodproducts =
          data.map((data) => FoodProduct.fromJson(data)).toList();

      print(foodproducts);
      return foodproducts;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw NetworkException();
    }
  }
}

class NetworkException implements Exception {}
