import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/models/restaurant_detail.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail_page';
  final String id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<RestaurantDetail> _restaurantDetail;
  String largeImageUrl = ApiService.largeImageUrl;

  @override
  void initState() {
    super.initState();
    _restaurantDetail = ApiService().detail(widget.id);
  }

  Widget _buildDetail(BuildContext context) {
    return FutureBuilder(
      future: _restaurantDetail,
      builder: (context, AsyncSnapshot<RestaurantDetail> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var restaurant = snapshot.data?.restaurant;
          var foods = restaurant?.menus.foods;
          var drinks = restaurant?.menus.drinks;
          var review = restaurant?.customerReviews;
          if (snapshot.hasData) {
            return ListView(
              children: [
                Hero(
                  tag: restaurant!.pictureId,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              largeImageUrl + restaurant.pictureId),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
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
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.black54,
                      size: 13,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(restaurant.rating.toString()),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(restaurant.description),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Foods',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: foods!.isEmpty
                      ? const Text('Tidak ada menu makanan tersedia saat ini')
                      : Row(children: [
                          for (int i = 0; i < foods.length; i++)
                            Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Text(
                                foods[i].name,
                              ),
                            ),
                        ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Drinks',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: drinks!.isEmpty
                      ? const Text('Restoran ini belum ada review')
                      : Row(children: [
                          for (int i = 0; i < drinks.length; i++)
                            Container(
                              padding: const EdgeInsets.all(8),
                              margin:
                                  const EdgeInsets.only(right: 8, bottom: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                              child: Text(
                                drinks[i].name,
                              ),
                            ),
                        ]),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Reviews',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: review!.isEmpty
                      ? const Text('Tidak ada menu minuman tersedia saat ini')
                      : Row(children: [
                          for (int i = 0; i < review.length; i++)
                            Container(
                              height: 150,
                              width: 200,
                              padding: const EdgeInsets.all(8),
                              margin:
                                  const EdgeInsets.only(right: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: whiteColor,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent.withOpacity(0.2),
                                    size: 100,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          child: Text(
                                            review[i].date,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                        Text(
                                          '"' + review[i].review + '"',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                          maxLines: 2,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: Text(
                                            '~' + review[i].name,
                                            textAlign: TextAlign.end,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ]),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Text('');
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildDetail(context),
      ),
    );
  }
}
