import 'package:flutter/material.dart';
import 'package:projetos_municipais/services/feeder_service.dart';
import 'package:projetos_municipais/widgets/custom_text.dart';

import '../models/feeder.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  bool isMetrics = false;

  List<Feeder> feeders = [];

  @override
  void initState() {
    _getAllFeeders();
    super.initState();
  }

  List<Feeder> _getAllFeeders() {
    getAllFeeders().then((value) {
      setState(() {
        feeders = value;
      });
    });

    return feeders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE3E3E3),
        body: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomAppBar(),
              SizedBox(height: 50),
              isMetrics
                  ? MetricsPanel()
                  : UserManagementPanel(
                      scrollController: widget.scrollController,
                      feeders: feeders,
                    ),
            ],
          ),
        ));
  }
}

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

// TODO alterar essa app bar, colocar o feedback de seleção da aba
class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTitle(title: 'Painel de administração'),
        SizedBox(width: 150),
        TextButton(
            onPressed: () {}, child: CustomSubTitle(subTitle: 'Métricas')),
        SizedBox(width: 60),
        TextButton(
            style:
                TextButton.styleFrom(textStyle: TextStyle(color: Colors.black)),
            // TODO alterar a cor do texto
            onPressed: () {},
            child: CustomSubTitle(subTitle: 'Gerenciar usuários')),
      ],
    );
  }
}

class MetricsPanel extends StatelessWidget {
  const MetricsPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey,
        height: 100,
        width: double.infinity,
      ),
    );
  }
}

class UserManagementPanel extends StatelessWidget {
  const UserManagementPanel(
      {super.key, required this.scrollController, required this.feeders});

  final ScrollController scrollController;
  final List<Feeder> feeders;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xff00518F).withValues(alpha: 80),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  children: [
                    CustomSubTitle(
                      subTitle: 'Usuários',
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSubTitle(subTitle: 'Nome'),
                      CustomSubTitle(subTitle: 'Email'),
                      CustomSubTitle(subTitle: 'Município'),
                      CustomSubTitle(subTitle: 'Agência')
                    ],
                  ),
                )),
            Divider(
              color: Colors.grey, // Cor da linha
              thickness: 0.5, // Espessura da linha
              height: 1, // Espaço acima e abaixo
            ),
            FeedersList(scrollController: scrollController, feeders: feeders)
          ],
        ),
      ),
    );
  }
}

class FeedersList extends StatefulWidget {
  const FeedersList(
      {super.key, required this.feeders, required this.scrollController});

  final ScrollController scrollController;
  final List<Feeder> feeders;

  @override
  State<FeedersList> createState() => _FeedersListState();
}

class _FeedersListState extends State<FeedersList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: SizedBox(
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: widget.feeders.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: Container(
              color: (index % 2 == 0) ? Colors.grey : Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSubTitle(subTitle: widget.feeders[index].name),
                  CustomSubTitle(subTitle: widget.feeders[index].email),
                  CustomSubTitle(subTitle: widget.feeders[index].city),
                  CustomSubTitle(subTitle: widget.feeders[index].agency)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
