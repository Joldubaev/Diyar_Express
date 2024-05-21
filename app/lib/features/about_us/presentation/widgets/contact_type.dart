import 'package:diyar_express/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum ContactType {
  delivery,
  diyarExpress,
  diyarRestaurant,
  diyarBanketHall,
  versal;

  String getTitle(BuildContext context) {
    return switch (this) {
      delivery => context.l10n.deliveryService,
      diyarExpress => context.l10n.deliveryServiceD,
      diyarRestaurant => context.l10n.diyarRestoran,
      diyarBanketHall => context.l10n.diyarRestoranHall,
      versal => context.l10n.versal,
    };
  }

  String getNumber() {
    return switch (this) {
      delivery => '+996 559 69-47-77',
      diyarExpress => '+996 509 69-47-77',
      diyarRestaurant => '+996 550 55-59-99',
      diyarBanketHall => '+996 555 51-11-15',
      versal => '+996 555 55-55-08',
    };
  }

  String get getAsset {
    return switch (this) {
      delivery => 'assets/images/delivery.png',
      diyarExpress => 'assets/images/clock.png',
      diyarRestaurant => 'assets/images/table.png',
      diyarBanketHall => 'assets/images/booking.png',
      versal => 'assets/images/hall.png',
    };
  }
}
