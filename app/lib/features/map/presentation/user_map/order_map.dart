import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:diyar_express/features/map/data/models/location_model.dart';
import 'package:diyar_express/features/map/data/repositories/location_repo.dart';
import 'package:diyar_express/features/map/data/repositories/yandex_service.dart';
import 'package:diyar_express/shared/utils/fmt/show_alert.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

@RoutePage()
class OrderMapPage extends StatefulWidget {
  const OrderMapPage({super.key});

  @override
  State<OrderMapPage> createState() => _OrderMapPageState();
}

class _OrderMapPageState extends State<OrderMapPage> {
  final mapControllerCompleter = Completer<YandexMapController>();
  final AddressRepository locationRepo = AddressRepository();
  final texControler = TextEditingController();
  String? address;

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  List<MapObject> mapObjects = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите адрес'),
      ),
      body: Stack(
        children: [
          YandexMap(
            nightModeEnabled: true,
            mapObjects: mapObjects,
            onMapTap: (point) {},
            onCameraPositionChanged: (cameraPosition, reason, finished) {
              if (finished) {
                updateAddressDetails(AppLatLong(
                  latitude: cameraPosition.target.latitude,
                  longitude: cameraPosition.target.longitude,
                ));
              }
            },
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
            },
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Icon(
              Icons.location_on,
              size: 30,
              color: Colors.red,
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        enableDrag: false,
        showDragHandle: true,
        backgroundColor: Colors.white,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.16,
          minHeight: MediaQuery.of(context).size.height * 0.16,
        ),
        onClosing: () {},
        builder: (context) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: address == null ? 0 : 1,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: ListTile(
                  title: FittedBox(
                    child: Text(address ?? 'Адрес не найден'),
                  ),
                  onTap: () {
                    AppAlert.showConfirmDialog(
                      context: context,
                      title: 'Ваш адрес',
                      content: Text(
                        'Вы уверены, что хотите использовать этот адрес?: $address',
                      ),
                      cancelText: 'Нет',
                      confirmText: 'Да',
                      cancelPressed: () => Navigator.pop(context),
                      confirmPressed: () {
                        Navigator.pop(context);
                        context.router.maybePop(address);
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fetchCurrentLocation();
        },
        child: const Icon(Icons.navigation),
      ),
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    final defLocation = BiskekLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    location = defLocation;
    await updateAddressDetails(location);
    _moveToCurrentLocation(location);
  }

  Future<void> _moveToCurrentLocation(AppLatLong appLatLong) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.smooth, duration: 4),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.latitude,
            longitude: appLatLong.longitude,
          ),
          zoom: 17,
        ),
      ),
    );
  }

  Future<void> updateAddressDetails(AppLatLong latLong) async {
    address = '... loading';
    setState(() {});
    LocationModel? data = await locationRepo.getLocationByAdress(latLong: latLong);
    address = data.response!.geoObjectCollection!.featureMember!.isEmpty
        ? 'unknown place'
        : data.response!.geoObjectCollection!.featureMember!.first.geoObject!.metaDataProperty!.geocoderMetaData!
            .address!.formatted
            .toString();

    setState(() {});
    log(' address: $address');
  }

  // void addObjects({required AppLatLong appLatLong}) {
  //   final myLocationMark = PlacemarkMapObject(
  //     opacity: 1,
  //     mapId: const MapObjectId('currentLocation'),
  //     point: Point(
  //       latitude: appLatLong.latitude,
  //       longitude: appLatLong.longitude,
  //     ),
  //     icon: PlacemarkIcon.single(
  //       PlacemarkIconStyle(
  //         image: BitmapDescriptor.fromAssetImage('assets/images/mark.png'),
  //         rotationType: RotationType.rotate,
  //       ),
  //     ),
  //   );

  //   final myLocationCircle = CircleMapObject(
  //     mapId: const MapObjectId('myLocationCircle'),
  //     circle: Circle(
  //       center: Point(
  //         latitude: appLatLong.latitude,
  //         longitude: appLatLong.longitude,
  //       ),
  //       radius: 250,
  //     ),
  //     strokeWidth: 0,
  //     fillColor: Colors.yellow.withOpacity(0.2),
  //   );
  //   mapObjects.addAll([myLocationMark, myLocationCircle]);
  //   setState(() {});
  // }

  // void addMarker({required Point point}) {
  //   final secondLocation = PlacemarkMapObject(
  //     opacity: 1,
  //     mapId: const MapObjectId('secondLocation'),
  //     point: point,
  //     icon: PlacemarkIcon.single(
  //       PlacemarkIconStyle(
  //           scale: 0.9,
  //           image: BitmapDescriptor.fromAssetImage('assets/images/mark.png'),
  //           rotationType: RotationType.rotate),
  //     ),
  //   );
  //   mapObjects.add(secondLocation);
  //   setState(() {});
  // }
}
