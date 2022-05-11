import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';
import 'package:restaurant_app/ui/detail_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Restaurant', style: Theme.of(context).textTheme.headline4),
              Text('Recommendation restaurant for you!',
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 16.0),
              Expanded(child: _buildList(context)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildList(BuildContext context) {
  return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Text('Data tidak ada');
        } else {
          final List<Restaurant> restaurants = parseRestaurants(snapshot.data);
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return _buildRestaurantItem(context, restaurants[index]);
              });
        }
      });
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
                  restaurant.pictureId,
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
              Text(
                restaurant.rating,
              ),
            ],
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurant);
      },
    ),
  );
}
