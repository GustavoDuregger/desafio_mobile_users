
import 'package:desafio_mobile/app/share/core/entities/picture_entity.dart';

class PictureModel extends PictureEntity {
  final String large;
  final String medium;
  final String thumbnail;

  const PictureModel(
      {required this.large, required this.medium, required this.thumbnail})
      : super(large: large, medium: medium, thumbnail: thumbnail);

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      large: json["large"],
      medium: json["medium"],
      thumbnail: json["thumbnail"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"large": large, "medium": medium, "thumbnail": thumbnail};
}