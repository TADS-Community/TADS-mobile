import 'package:flutter/material.dart';
import 'package:tads_app/src/config/constants/constants.dart';
import 'package:tads_app/src/features/main/presentation/widgets/donation_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    AppConsts.setSize(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        itemBuilder: (_, index) {
          return DonationItem(
            onTap: () {
              // Navigator.of(context).pushNamed(AppRoutes.login);
            },
            cacheKey: 'cacheKey',
            imageUrl:
                'https://cdn.uzd.udevs.io/uzdigital/images/ec80c248-ddb8-4b68-98b1-0d59e9a1acdd.jpg',
            width: AppConsts.size.width,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 12);
        },
        itemCount: 10,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
