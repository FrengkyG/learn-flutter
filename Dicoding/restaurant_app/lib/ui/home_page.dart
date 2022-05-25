import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_list.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/ui/detail_page.dart';
import 'package:restaurant_app/ui/search_result_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String smallImageUrl = ApiService.smallImageUrl;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = Text('Restaurant', style: myTextTheme.headline4);

  Widget _buildList(BuildContext context) {
    return Consumer<RestaurantListProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.state == ResultState.HasData) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return _buildRestaurantItem(context, restaurant);
            });
      } else if (state.state == ResultState.NoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return const Center(
            child: Text("Oops. Terjadi Kesalahan. Mohon coba kembali"));
      } else {
        return const Center(
          child: Text(''),
        );
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
                    smallImageUrl + restaurant.pictureId,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: customSearchBar,
        actions: [
          IconButton(
            icon: customIcon,
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'input restaurant name',
                            hintStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          size: 28,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, SearchResultPage.routeName,
                              arguments: _searchController.text);
                        },
                      ),
                    ],
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar =
                      Text('Restaurant', style: myTextTheme.headline4);
                  _searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recommendation restaurant for you!',
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 16.0),
              Expanded(
                  child: ChangeNotifierProvider<RestaurantListProvider>(
                      create: (_) =>
                          RestaurantListProvider(apiService: ApiService()),
                      child: _buildList(context))),
            ],
          ),
        ),
      ),
    );
  }
}
