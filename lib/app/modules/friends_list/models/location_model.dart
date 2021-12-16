
import 'package:desafio_mobile/app/share/core/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  final String city;
  final String state;
  final String country;
  final int postcode;

  const LocationModel(
      {required this.city,
      required this.state,
      required this.country,
      required this.postcode})
      : super(city: city, state: state, country: country, postcode: postcode);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      city: json["city"],
      state: json["state"],
      country: json["country"],
      postcode: json["postcode"],
    );
  }

  Map<String, dynamic> toJson() =>
      {"city": city, "state": state, "country": country, "postcode": postcode};
}
