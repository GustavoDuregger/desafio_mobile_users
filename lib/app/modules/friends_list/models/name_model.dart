
import 'package:desafio_mobile/app/share/core/entities/name_entity.dart';

class NameModel extends NameEntity {
  final String title;
  final String first;
  final String last;

  const NameModel(
      {required this.title, required this.first, required this.last})
      : super(title: title, first: first, last: last);

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      title: json["title"],
      first: json["first"],
      last: json["last"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"title": title, "first": first, "last": last};
}
