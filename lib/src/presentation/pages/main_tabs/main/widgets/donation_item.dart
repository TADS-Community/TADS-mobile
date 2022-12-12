import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:tads_app/src/presentation/components/place_holders/image_place_holder.dart';

class DonationItem extends StatelessWidget {
  const DonationItem({
    Key? key,
    required this.cacheKey,
    required this.imageUrl,
    required this.width,
  }) : super(key: key);

  final String cacheKey;
  final String imageUrl;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: width * 0.5,
            width: double.maxFinite,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                cacheManager:
                    CacheManager(Config(cacheKey, maxNrOfCacheObjects: 100)),
                fit: BoxFit.cover,
                placeholder: (context, url) => const ImagePlaceHolder(),
                errorWidget: (_, url, error) => const ImagePlaceHolder(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '50000 trees/year for a self-reliant rural Senegal',
            style:
                Theme.of(context).textTheme.headline6?.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
