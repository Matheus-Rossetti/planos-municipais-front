import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projetos_municipais/utils/api_routes.dart';

import '/models/feeder.dart';

void createNewFeeder(String name, String email, String password, String city,
    String agency) async {
  Feeder feeder = Feeder(name: name, email: email, city: city, agency: agency);

  await http.post(
    Uri.parse(ApiRoute.feeder),
    body: feeder.toJson(),
    headers: {'Content-Type': 'application/json'},
  );
}

Future<List<Feeder>> getAllFeeders() async {
  final response = await http.get(Uri.parse(ApiRoute.feeder));

  final List feedersJson = jsonDecode(response.body);

  List<Feeder> feeders = [];

  for (Map<String, dynamic> item in feedersJson) {
    feeders.add(Feeder.fromJson(item));
  }

  return feeders;
}
