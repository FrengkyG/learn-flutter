import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_list.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';

import 'fetch_restaurant_list_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  var expectedRestaurant = {
    "id": "rqdv5juczeskfw1e867",
    "name": "Melting Pot",
    "description":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.",
    "pictureId": "14",
    "city": "Medan",
    "rating": 4.2
  };

  group('Fetch Restaurant List', () {
    test('Verify JSON', () async {
      RestaurantListProvider restaurantListProvider;
      ApiService api;

      api = MockApiService();

      when(api.list()).thenAnswer((_) async =>
          Future.value(RestaurantList.fromJson(expectedRestaurant)));

      restaurantListProvider = RestaurantListProvider(apiService: api);

      await restaurantListProvider.fetchList();

      Timer(const Duration(seconds: 3), () {
        var result1 = restaurantListProvider.result.restaurants[0].id ==
            RestaurantList.fromJson(expectedRestaurant).restaurants[0].id;

        var result2 = restaurantListProvider.result.restaurants[0].name ==
            RestaurantList.fromJson(expectedRestaurant).restaurants[0].name;

        var result3 =
            restaurantListProvider.result.restaurants[0].description ==
                RestaurantList.fromJson(expectedRestaurant)
                    .restaurants[0]
                    .description;

        var result4 = restaurantListProvider.result.restaurants[0].pictureId ==
            RestaurantList.fromJson(expectedRestaurant)
                .restaurants[0]
                .pictureId;

        var result5 = restaurantListProvider.result.restaurants[0].city ==
            RestaurantList.fromJson(expectedRestaurant).restaurants[0].city;

        var result6 = restaurantListProvider.result.restaurants[0].rating ==
            RestaurantList.fromJson(expectedRestaurant).restaurants[0].rating;

        expect(result1, true);
        expect(result2, true);
        expect(result3, true);
        expect(result4, true);
        expect(result5, true);
        expect(result6, true);
      });
    });
  });
}
