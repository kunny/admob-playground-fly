import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../destination.dart';

const _adaptiveBannerAdUnitId = 'ca-app-pub-3940256099942544/9214589741';

const _collapsibleBannerAdUnitId = 'ca-app-pub-3940256099942544/2014213617';

class DestinationListPage extends StatefulWidget {
  const DestinationListPage({super.key});

  @override
  State createState() => _DestinationListPageState();
}

class _DestinationListPageState extends State<DestinationListPage> {
  late double deviceWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    deviceWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fly"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _destinations.length,
              itemBuilder: (context, index) {
                final item = _destinations[index];
                return ListTile(
                  leading: Image.asset(
                    item.asset,
                    width: 48,
                    height: 48,
                    package: 'flutter_gallery_assets',
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text(item.duration),
                  onTap: () {
                    context.go(
                      '/destination',
                      extra: item,
                    );
                  },
                );
              },
            ),
          ),
          // TODO: Add anchored adaptive banner

        ],
      ),
    );
  }
}

const _destinations = [
  Destination(
    name: 'Aspen, United States',
    duration: '1 stop · 6h 15m',
    asset: 'crane/destinations/fly_0.jpg',
  ),
  Destination(
    name: 'Big Sur, United States',
    duration: 'Nonstop · 13h 30m',
    asset: 'crane/destinations/fly_1.jpg',
  ),
  Destination(
    name: 'Khumbu Valley, Nepal',
    duration: 'Nonstop · 5h 16m',
    asset: 'crane/destinations/fly_2.jpg',
  ),
  Destination(
    name: 'Machu Picchu, Peru',
    duration: '2 stops · 19h 40m',
    asset: 'crane/destinations/fly_3.jpg',
  ),
  Destination(
    name: 'Malé, Maldives',
    duration: 'Nonstop · 8h 24m',
    asset: 'crane/destinations/fly_4.jpg',
  ),
  Destination(
    name: 'Vitznau, Switzerland',
    duration: '1 stop · 14h 12m',
    asset: 'crane/destinations/fly_5.jpg',
  ),
  Destination(
    name: 'Mexico City, Mexico',
    duration: 'Nonstop · 5h 24m',
    asset: 'crane/destinations/fly_6.jpg',
  ),
  Destination(
    name: 'Mount Rushmore, United States',
    duration: '1 stop · 5h 43m',
    asset: 'crane/destinations/fly_7.jpg',
  ),
  Destination(
    name: 'Singapore',
    duration: 'Nonstop · 8h 25m',
    asset: 'crane/destinations/fly_8.jpg',
  ),
  Destination(
    name: 'Havana, Cuba',
    duration: '1 stop · 15h 52m',
    asset: 'crane/destinations/fly_9.jpg',
  ),
  Destination(
    name: 'Cairo, Egypt',
    duration: 'Nonstop · 5h 57m',
    asset: 'crane/destinations/fly_10.jpg',
  ),
  Destination(
    name: 'Lisbon, Portugal',
    duration: '1 stop · 13h 24m',
    asset: 'crane/destinations/fly_11.jpg',
  ),
];
