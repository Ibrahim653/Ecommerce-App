import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final User user;
  final String message;

  RegisterResponse({required this.user, required this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: 'last_login')
  final String? lastLogin;
  @JsonKey(name: 'is_superuser')
  final bool isSuperUser;
  final String username;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'is_staff')
  final bool isStaff;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'date_joined')
  final String dateJoined;
  @JsonKey(name: 'groups')
  final List<dynamic> groups;
  @JsonKey(name: 'user_permissions')
  final List<dynamic> userPermissions;

  User({
    required this.id,
    this.lastLogin,
    required this.isSuperUser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.groups,
    required this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
