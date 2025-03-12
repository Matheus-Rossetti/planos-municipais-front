import 'package:flutter/material.dart';
import 'package:projetos_municipais/widgets/custom_text.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  bool isMetrics = false;

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
              isMetrics ? MetricsPanel() : UserManagementPanel(),
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
  const UserManagementPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        // child: Column(
        //   children: [
        //     Container(),
        //     SizedBox(
        //       child: ListView.builder(
        //         itemCount: 10,
        //         itemBuilder: (context, index) => Placeholder(),
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
