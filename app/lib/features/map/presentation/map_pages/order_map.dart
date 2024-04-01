import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/map/presentation/map_pages/search_page.dart';
import 'package:diyar_express/features/map/presentation/map_pages/suggest_page.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../widgets/map_app.dart';

@RoutePage()
class OrderMapPage extends StatelessWidget {
  const OrderMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: OrderMapBody(
      latitude: 42.870000,
      longitude: 74.590000,
    ));
  }
}

const List<MapPage> _allPages = <MapPage>[
  SuggestionsPage(),
  SearchPage(),
];

class OrderMapBody extends StatefulWidget {
  const OrderMapBody({Key? key, required this.latitude, required this.longitude}) : super(key: key);

  final double latitude;

  final double longitude;

  @override
  State<OrderMapBody> createState() => _OrderMapBodyState();
}

class _OrderMapBodyState extends State<OrderMapBody> {
  void _pushPage(BuildContext context, MapPage page) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (_) => Scaffold(
                appBar: AppBar(title: Text(page.title)),
                body: Container(padding: const EdgeInsets.all(8), child: page))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('YandexMap examples')),
        body: Column(children: <Widget>[
          Expanded(child: Container(padding: const EdgeInsets.all(8), child: const YandexMap())),
          Expanded(
              child: ListView.builder(
            itemCount: _allPages.length,
            itemBuilder: (_, int index) => ListTile(
              title: Text(_allPages[index].title),
              onTap: () => _pushPage(context, _allPages[index]),
            ),
          ))
        ]));
  }
}
