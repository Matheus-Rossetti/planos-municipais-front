import 'dart:convert';

import 'package:http/http.dart' as http;
import '/services/feeder_service.dart';



void main() {
  // fetchMunicipioData();

  // addMunicipioData();

}

void fetchMunicipioData() async {
  String url = 'http://localhost:8080/municipio';

  final response = await http.get(Uri.parse(url));

  print(response.body);
}

void addMunicipioData() async {
  String url = 'http://localhost:8080/municipio';

  const listaMunicipios = [
    "Barra Velha",
    "Corupá",
    "Guaramirim",
    "Jaraguá do Sul",
    "Massaranduba",
    "São João do Itaperiú",
        "Schroeder",
  ];

  for(var item in listaMunicipios){
    final data = {"name": item};

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.body);
  }
}



