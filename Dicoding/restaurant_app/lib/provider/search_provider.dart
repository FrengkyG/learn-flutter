import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/search_result.dart';
import 'package:restaurant_app/utils/result_state.dart';

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;
  final String query;
  SearchProvider({required this.apiService, required this.query}) {
    _fetchSearch();
  }

  late SearchResult _restaurantSearch;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  SearchResult get result => _restaurantSearch;

  ResultState get state => _state;

  Future<dynamic> _fetchSearch() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurantSearch = await apiService.search(query);

      if (restaurantSearch.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantSearch = restaurantSearch;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Oops. Terjadi Kesalahan. Mohon coba kembali';
    }
  }
}
