import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.person_pin,
              size: 64,
            ),
          ),
        ),
        Visibility(
          visible: '$firstName $lastName'.trim().isNotEmpty,
          child: Text(
            '$firstName $lastName',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: '$firstName $lastName'.trim().isEmpty
                    ? Colors.grey
                    : null),
          ),
        ),
      ],
    );
  }
}
