import 'package:flutter/material.dart';
import 'package:tads_app/src/config/routes/app_routes.dart';
import 'package:tads_app/src/presentation/pages/bottom_bar_tabs/main/widgets/donation_item.dart';

class MainTab extends StatelessWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      itemBuilder: (_, index) {
        return DonationItem(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.login);
          },
          cacheKey: 'cacheKey',
          imageUrl: 'https://cdn.uzd.udevs.io/uzdigital/images/ec80c248-ddb8-4b68-98b1-0d59e9a1acdd.jpg',
          width: size.width,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12);
      },
      itemCount: 10,
    );
  }
}
