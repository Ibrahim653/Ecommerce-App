import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String name;
  final String email;
  final String password;
  final String phone;
  final int gender;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfimation;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.gender,
    required this.passwordConfimation,
  });
  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
