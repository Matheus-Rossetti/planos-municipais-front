import '/models/plan.dart';
import 'package:http/http.dart' as http;


Future<Plan> fetchPlanData() async{

  String url = 'localhost:8080/plan/1'; // id '1' para teste

  dynamic jsonData = await http.get(Uri.parse(url));


  return Plan(
    name: jsonData['name'],
    description: jsonData['description'],
    year: jsonData['year'],
    agency: jsonData['agency'],
    objective: jsonData['objective'],
    goals: jsonData['goals'],
    legislation: jsonData['legislation'],
    status: jsonData['status'],
    dia_de_publicacao: jsonData['dia_de_publicacao'],
    image: jsonData['image']
  );
}