import 'dart:convert';

import 'package:restaurant_app/data/models/restaurant_detail.dart';
import 'package:restaurant_app/data/models/restaurant_list.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/models/search_result.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String smallImageUrl = _baseUrl + 'images/small/';
  static const String mediumImageUrl = _baseUrl + 'images/medium/';
  static const String largeImageUrl = _baseUrl + 'images/large/';

  Future<RestaurantList> list() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Restaurant List');
    }
  }

  Future<RestaurantDetail> detail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + "detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Restaurant Detail');
    }
  }

  Future<SearchResult> search(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + "search/?q=$query"));
    if (response.statusCode == 200) {
      return SearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Search Result');
    }
  }
}
