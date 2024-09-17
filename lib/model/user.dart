import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyappsdicoding/model/login_result.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required bool? error,
    required String? message,
    required LoginResult? loginResult,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
