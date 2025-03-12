import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle(
      {super.key, required this.title, this.color = Colors.black});

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle(
      {super.key, required this.subTitle, this.color = Colors.black});

  final String subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}
