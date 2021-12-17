
import 'package:desafio_mobile/app/modules/user_profile/models/user_profile_model.dart';

class UserProfileResponse {
  final List<UserProfileModel> userProfile;
  UserProfileResponse(this.userProfile);

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    var UserProfileFromJson = json['results'];

    List<UserProfileModel> userProfile =
    List<UserProfileModel>.from(UserProfileFromJson.map((element) {
      return UserProfileModel.fromJson(element);
    }).toList());

    UserProfileResponse result =
    UserProfileResponse(userProfile);

    return result;
  }
}