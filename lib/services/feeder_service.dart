import 'package:http/http.dart' as http;
import 'package:projetos_municipais/utils/api_routes.dart';

import '/models/feeder.dart';

void createNewFeeder(
    String name, String email, String password, int city, String agency) async {
  Feeder newFeeder = Feeder(
      name: name, email: email, password: password, city: city, agency: agency);

  await http.post(
    Uri.parse(ApiRoute.feeder),
    body: newFeeder.toJson(),
    headers: {'Content-Type': 'application/json'},
  );
}
