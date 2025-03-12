import 'dart:convert';

class Feeder {
  String name;
  String email;
  String city;
  String agency;

  Feeder(
      {required this.name,
      required this.email,
      required this.city,
      required this.agency});

  toJson() {
    Map<String, dynamic> mappedFeederData = {
      'name': name,
      'email': email,
      'city': {'id': city},
      'agency': agency,
    };
    return jsonEncode(mappedFeederData);
  }

  factory Feeder.fromJson(Map<String,dynamic> feeder) {
    return Feeder(
      name: feeder['name'],
      email: feeder['email'],
      city: feeder['city']['name'],
      agency: feeder['agency'],
    );
  }
}
