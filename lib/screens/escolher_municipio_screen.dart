import 'package:flutter/material.dart';

class EscolherMunicipioPage extends StatelessWidget {
  const EscolherMunicipioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final jaragua = Municipio(
      'Jaraguá do Sul',
      0xff86C226,
      r'lib/assets/JS.png',
    );

    final massaranduba = Municipio('massaranduba', 0xffE92D2C, '');
    final schroeder = Municipio('Schroeder', 0xff00923F, '');
    final barraVelha = Municipio('Barra Velha', 0xff015198, '');
    final corupa = Municipio('Corupá', 0xffF8C301, '');
    final saoJoaoDoItaperiu = Municipio(r'São João do Itaperiú', 0xffF, '');
    final guaramirim = Municipio('Guaramirim', 0xff00ADEF, '');
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('lib/assets/fundo.png', fit: BoxFit.fill),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PastaMunicipio(municipio: jaragua),
                  PastaMunicipio(municipio: massaranduba),
                  PastaMunicipio(municipio: schroeder),
                ],
              ),
              SizedBox(height: 100),
              Row(
                children: [
                  PastaMunicipio(municipio: corupa),
                  // PastaMunicipio(municipio: saoJoaoDoItaperiu),
                  PastaMunicipio(municipio: guaramirim),
                  PastaMunicipio(municipio: barraVelha),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class PastaMunicipio extends StatefulWidget {
  const PastaMunicipio({super.key, required this.municipio});

  final Municipio municipio;

  @override
  State<PastaMunicipio> createState() => PastaMunicipioState();
}

class PastaMunicipioState extends State<PastaMunicipio> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHovered = true),
      onExit: (event) => setState(() => isHovered = false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            height: isHovered ? 60 : 48,
            decoration: BoxDecoration(
              color: isHovered ? Colors.white : Color(widget.municipio.color),
              // border: isHovered
              //     ? Border.all(
              //         width: 3,
              //         color: Color(widget.municipio.color),
              //       )
              //     : Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 7, right: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.municipio.name,
                    style: TextStyle(
                      color: isHovered
                          ? Color(widget.municipio.color)
                          : Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 270,
            height: 200,
            decoration: BoxDecoration(
              color: isHovered ? Colors.white : Color(widget.municipio.color),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight:
                      isHovered ? Radius.circular(10) : Radius.circular(0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                      10,
                    )),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset( 
                      fit: BoxFit.cover,
                      widget.municipio.image,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// TODO transferir essa classe para um arquivo de aux
class Municipio {
  String name;
  int color;
  String image;

  Municipio(this.name, this.color, this.image);
}

// r'https://as1.ftcdn.net/jpg/04/55/17/16/1000_F_455171602_Zcu6B6a9r09PEnLdQJ5EjhJRgPkTvlZv.jpg';
