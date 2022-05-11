import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  final Restaurant restaurant;
  const DetailPage({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(restaurant.pictureId),
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
              child: restaurant.menus['foods'].length < 1
                  ? const Text('Tidak ada menu makanan tersedia saat ini')
                  : Row(children: [
                      for (int i = 0; i < restaurant.menus['foods'].length; i++)
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.secondary),
                          child: Text(
                            restaurant.menus['foods'][i]['name'].toString(),
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
              child: restaurant.menus['drinks'].length < 1
                  ? const Text('Tidak ada menu minuman tersedia saat ini')
                  : Row(children: [
                      for (int i = 0;
                          i < restaurant.menus['drinks'].length;
                          i++)
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(right: 8, bottom: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).colorScheme.secondary),
                          child: Text(
                            restaurant.menus['drinks'][i]['name'].toString(),
                          ),
                        ),
                    ]),
            ),
          ],
        ),
      ),
    );
  }
}
