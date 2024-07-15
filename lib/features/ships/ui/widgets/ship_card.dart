import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/features/ships/data/models/ships_model.dart';
import 'package:beyond_the_stars/features/ships/ui/widgets/ship_image.dart';
import 'package:flutter/material.dart';

class ShipCard extends StatelessWidget {
  const ShipCard({super.key, required this.ship});
  final ShipsModel ship;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.shipDetails, arguments: ship);
        },
        child: Card(
          color: const Color(0xff5A72A0),
          child: Row(
            children: [
              ShipImage(
                shipImage: ship.image ?? '',
                shipId: ship.id ?? '',
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ship.name ?? '',
                      style: AppTextStyles.style18W600,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('🌎${ship.homePort ?? ''}'),
                    const SizedBox(
                      height: 16,
                    ),
                    RowIsActive(isActive: ship.active ?? false)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
