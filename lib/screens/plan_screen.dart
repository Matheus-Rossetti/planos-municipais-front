import 'package:flutter/material.dart';

import '/models/plan.dart';
import '/services/plan_service.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late Plan plan;

  @override
  void initState() {
    fetchPlanData();
    super.initState();
  }

  void fetchPlan() {
    setState(() async {
      plan =
          await fetchPlanData(); // TODO arrumar essa questão do async aqui, puxar da api e atualizar o objeto 'plan'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MainScroll(scrollController: widget.scrollController, plan: plan),
          Glossary(),
        ],
      ),
    );
  }
}

class Glossary extends StatelessWidget {
  Glossary({
    super.key,
  });

  final List<String> glossary = [
    'Descrição',
    'Objetivos',
    'Metas',
    'Legislação',
    'Imagens',
    'Mapas'
  ]; // TODO receber o glossário da api (da tabela plan-layout)

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 250,
      child: Container(
        height: 600,
        width: 400,
        // color: Colors.red,
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Glossário',
              style: TextStyle(fontSize: 33),
            ),
            SizedBox(height: 15),
            ...glossary.map((item) => Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    item,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 22),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class MainScroll extends StatelessWidget {
  const MainScroll(
      {super.key, required this.scrollController, required this.plan});

  final Plan plan;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: scrollController,
      slivers: [
        SliverAppBar(
          collapsedHeight: 70,
          expandedHeight: 200,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: const EdgeInsets.only(right: 200, left: 200),
              child: Row(
                children: [Text(plan.name), Spacer(), Text(plan.agency)],
              ),
            ),
            background: Center(
                child: Text(
              'Município',
              style: TextStyle(fontSize: 40),
            )),
            collapseMode: CollapseMode.parallax,
          ),
          backgroundColor: Colors.lightGreen,
          pinned: true,
        ),
        SliverList(delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
          return ContentContainer();
        }))
      ],
    );
  }
}

// ------------- tests
class ContentContainer extends StatelessWidget {
  const ContentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(
          height: 500,
          width: 900,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
