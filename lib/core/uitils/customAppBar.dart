import 'package:flutter/material.dart';
import 'package:news_app/core/TextStyle.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rightText;
  const CustomAppbar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title, style: CustomTextstyle.text24BoldBlue),
          Text(subtitle, style: CustomTextstyle.text24BoldOrange),
          Spacer(),
          Text(rightText, style: CustomTextstyle.text16Boldgray),
        ],
      ),
    );
  }
}
