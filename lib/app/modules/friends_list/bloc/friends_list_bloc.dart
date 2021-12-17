import 'package:desafio_mobile/app/modules/friends_list/models/friends_list_response.dart';
import 'package:desafio_mobile/app/modules/friends_list/resources/friends_list_repository.dart';
import 'package:rxdart/rxdart.dart';

final getFriendsListBloc = GetFriendsBloc();

class GetFriendsBloc {
  final FriendsListRepository _repository = FriendsListRepository();
  final BehaviorSubject<FriendsListResponse> _subject =
  BehaviorSubject<FriendsListResponse>();

  getFriendsList() async {
    FriendsListResponse response = await _repository.getFriendsList();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<FriendsListResponse> get subject => _subject;
}