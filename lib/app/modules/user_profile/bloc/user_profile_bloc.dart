
import 'package:desafio_mobile/app/modules/user_profile/models/user_profile_response.dart';
import 'package:desafio_mobile/app/modules/user_profile/resources/user_profile_repository.dart';
import 'package:rxdart/rxdart.dart';

final getUserProfileBloc = GetUserProfileBloc();

class GetUserProfileBloc {
  final UserProfileRepository _repository = UserProfileRepository();
  final BehaviorSubject<UserProfileResponse> _subject =
  BehaviorSubject<UserProfileResponse>();

  getUserProfile() async {
    UserProfileResponse response = await _repository.getUserProfile();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserProfileResponse> get subject => _subject;
}