import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_list.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantListProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantListProvider({required this.apiService}) {
    _fetchList();
  }

  late RestaurantList _restaurant;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  RestaurantList get result => _restaurant;

  ResultState get state => _state;

  Future<dynamic> _fetchList() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantList = await apiService.list();

      if (restaurantList.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurant = restaurantList;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Oops. Terjadi Kesalahan. Mohon coba kembali';
    }
  }
}
