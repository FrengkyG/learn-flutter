import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/ui/detail_content_page.dart';
import 'package:restaurant_app/utils/result_state.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String largeImageUrl = ApiService.largeImageUrl;

  Widget _buildDetail(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        var restaurant = state.result.restaurant;
        var foods = restaurant.menus.foods;
        var drinks = restaurant.menus.drinks;
        var review = restaurant.customerReviews;
        return DetailContent(
            restaurant: restaurant,
            largeImageUrl: largeImageUrl,
            foods: foods,
            drinks: drinks,
            review: review);
      } else if (state.state == ResultState.noData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.error) {
        return const Center(
            child: Text("Oops. Terjadi Kesalahan. Mohon coba kembali"));
      } else {
        return const Center(child: Text(''));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String id = widget.id;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChangeNotifierProvider<RestaurantDetailProvider>(
            create: (_) =>
                RestaurantDetailProvider(apiService: ApiService(), id: id),
            child: _buildDetail(context)),
      ),
    );
  }
}
