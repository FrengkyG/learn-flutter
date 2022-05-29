import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/api/api_service.dart';

void main() {
  test('Verify JSON - Check parameter from API Response', () async {
    var api = ApiService();

    var resultApi = await api.list();
    var resultList = resultApi.restaurants[0].toJson();

    var result = (resultList.containsKey('id') &&
        resultList.containsKey('name') &&
        resultList.containsKey('description') &&
        resultList.containsKey('pictureId') &&
        resultList.containsKey('city') &&
        resultList.containsKey('rating'));
    expect(result, true);
  });
}
