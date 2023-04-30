import 'package:flutter/material.dart';

class DonationItem extends StatelessWidget {
  const DonationItem({
    Key? key,
    required this.onTap,
    required this.cacheKey,
    required this.width,
  }) : super(key: key);

  final VoidCallback onTap;
  final String cacheKey;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColorLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              '50000 trees/year for a self-reliant rural Senegal',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
