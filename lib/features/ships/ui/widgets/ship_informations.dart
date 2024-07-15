import 'package:beyond_the_stars/features/ships/data/models/ships_model.dart';
import 'package:beyond_the_stars/features/ships/ui/widgets/custom_ship_data_row.dart';
import 'package:flutter/material.dart';

class ShipInformations extends StatelessWidget {
  const ShipInformations({super.key, required this.ship});
  final ShipsModel ship;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomShipDataRow(title: 'name', value: ship.name.toString()),
          CustomShipDataRow(
              title: 'Year built', value: ship.yearBuilt.toString()),
          CustomShipDataRow(title: 'Mass kg', value: ship.massKg.toString()),
          CustomShipDataRow(title: 'Role', value: ship.roles?[0] ?? ''),
          CustomShipDataRow(title: 'Type', value: ship.type ?? '')
        ],
      ),
    );
  }
}
