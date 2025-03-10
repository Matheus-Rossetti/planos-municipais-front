class Plan {
  String name;
  String description;
  int year;
  String agency;
  String objective;
  String goals;
  String legislation;
  String status;
  String dia_de_publicacao;

  String image; // Lista de URLs

  Plan(
      {required this.name,
        required this.description,
        required this.year,
        required this.agency,
        required this.objective,
        required this.goals,
        required this.legislation,
        required this.status,
        required this.dia_de_publicacao,
        required this.image});
}