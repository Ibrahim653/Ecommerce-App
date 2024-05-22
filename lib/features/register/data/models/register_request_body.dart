import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String username;
  final String password;
  final String email;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;

  RegisterRequestBody({
    required this.username,
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
  });
  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
