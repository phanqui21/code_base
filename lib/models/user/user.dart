// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    @Default('') String username,
    @Default('') String email,
    @Default('') String gender,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String image,
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

