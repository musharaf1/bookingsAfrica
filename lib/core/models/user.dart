import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String email;
  String first_name;
  String last_name;
  String avater;

  UserModel({
    this.id,
    this.email,
    this.first_name,
    this.last_name,
    this.avater,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> jsonString = _$UserModelToJson(this);
  //   jsonString.removeWhere((key, value) => value == null);
  //   return jsonString;
  // }
}
