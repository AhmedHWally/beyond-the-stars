import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/features/home/ui/widgets/rocket_loading_shimmer.dart';
import 'package:flutter/material.dart';

class ShipImage extends StatelessWidget {
  const ShipImage({
    super.key,
    required this.shipImage,
  });

  final String shipImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(9)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * .35,
            height: MediaQuery.sizeOf(context).height * .175,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                shipImage,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  AppImages.noImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowIsActive extends StatelessWidget {
  final bool isActive;
  const RowIsActive({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('status:'),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            isActive ? 'Active' : 'Not Active',
            style: TextStyle(
                shadows: const [
                  Shadow(
                      color: Colors.black, offset: Offset(1, 1), blurRadius: 1)
                ],
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.green.shade400 : Colors.red),
          ),
        ),
      ],
    );
  }
}
