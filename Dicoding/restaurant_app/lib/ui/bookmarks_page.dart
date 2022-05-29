import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_list.dart';
import 'package:restaurant_app/ui/detail_page.dart';

import '../provider/database_provider.dart';
import '../utils/result_state.dart';

class BookmarksPage extends StatelessWidget {
  static const routeName = '/bookmark_page';
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Favorite Restaurants',
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
              child: _buildList(),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildList() {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.hasData) {
          return ListView.builder(
            itemCount: provider.bookmarks.length,
            itemBuilder: (context, index) {
              var restaurant = provider.bookmarks[index];
              return _buildRestaurantItem(context, restaurant);
            },
          );
        } else {
          return Center(
            child: Text(provider.message),
          );
        }
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.primary),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: Hero(
          tag: restaurant.pictureId,
          child: Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    ApiService.smallImageUrl + restaurant.pictureId,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        title: Text(restaurant.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.pin_drop,
                  color: Colors.black54,
                  size: 13,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(restaurant.city),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.black54,
                  size: 15,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(restaurant.rating.toString()),
              ],
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, DetailPage.routeName,
              arguments: restaurant.id);
        },
      ),
    );
  }
}
