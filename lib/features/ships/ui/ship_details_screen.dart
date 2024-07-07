import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/custom_floating_sliver_appbar.dart';
import 'package:beyond_the_stars/features/ships/data/models/ships_model.dart';
import 'package:flutter/material.dart';

class ShipDetailsScreen extends StatelessWidget {
  const ShipDetailsScreen({super.key, required this.ship});
  final ShipsModel ship;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.authBackGround), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            CustomFloatingSliverAppBar(
              title: ship.name,
              image: ship.image,
              style: AppTextStyles.style18W600,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 800,
              ),
            )
          ],
        ),
      ),
    );
  }
}
