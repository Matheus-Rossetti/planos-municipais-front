import 'package:flutter/material.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import 'screens/admin_panel_screen.dart';

void main() {
  runApp(ProjetosMunicipais());
}

class ProjetosMunicipais extends StatefulWidget {
  const ProjetosMunicipais({super.key});

  @override
  State<ProjetosMunicipais> createState() => _ProjetosMunicipaisState();
}

class _ProjetosMunicipaisState extends State<ProjetosMunicipais> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projetos Municipais',
      debugShowCheckedModeBanner: false,
      home: WebSmoothScroll(
        scrollAnimationLength: 750,
        controller: _scrollController,
        child: AdminPanelScreen(),
      ),
    );
  }
}
