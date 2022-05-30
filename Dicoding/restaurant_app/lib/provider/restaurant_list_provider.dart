import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_list.dart';
import 'package:restaurant_app/utils/result_state.dart';

class RestaurantListProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantListProvider({required this.apiService}) {
    fetchList();
  }

  late RestaurantList _restaurant;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantList get result => _restaurant;

  ResultState get state => _state;

  Future<dynamic> fetchList() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurantList = await apiService.list();

      if (restaurantList.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurant = restaurantList;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Oops. Terjadi Kesalahan. Mohon coba kembali';
    }
  }
}
