import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.uid = '',
    this.emailVerified = false,
    this.phoneVerified = false,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String uid;
  final bool emailVerified;
  final bool phoneVerified;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phone,
        uid,
        emailVerified,
        phoneVerified,
      ];
}
