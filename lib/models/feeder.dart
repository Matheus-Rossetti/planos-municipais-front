import 'dart:convert';

class Feeder{

  String name;
  String email;
  String password;
  int city;
  String agency;

  Feeder({required this.name, required this.email, required this.password, required this.city, required this.agency});

   toJson(){
    Map<String, dynamic> mappedFeederData = {
      'name': name,
      'email': email,
      'password': password,
      'city': {'id': city},
      'agency': agency
    };

    return jsonEncode(mappedFeederData);
  }

}