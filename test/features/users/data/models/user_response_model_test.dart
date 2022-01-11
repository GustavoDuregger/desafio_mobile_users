
import 'dart:convert';
import 'package:desafio_mobile/features/users/data/models/user_model.dart';
import 'package:desafio_mobile/features/users/data/models/user_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('Should convert a json to a UserResponseModel with correct values', () async {
    final json = jsonDecode(fixture("user_response.json"));
    final result = UsersResponse.fromJson(json);

    expect(result.users, isA<List<UserModel>>());
    expect(result.users.length, equals(10));
  });
}