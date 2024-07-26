import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';

class JJobDescription extends StatelessWidget {
  const JJobDescription({
    super.key,
    required this.requirements,
    required this.salary,
    required this.description,
  });
  final String requirements, salary, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        JJobSimpleDescription(
            title: "Mô tả công việc", description: description),
        JJobSimpleDescription(
            title: "Mức lương & phúc lợi", description: salary),
        JJobSimpleDescription(title: "Yêu cầu", description: requirements)
      ],
    );
  }
}

class JJobSimpleDescription extends StatelessWidget {
  const JJobSimpleDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const Border(top: BorderSide.none),
      tilePadding: EdgeInsets.zero,
      title: JSectionHeading(title: title),
      collapsedIconColor: JColors.primary,
      iconColor: JColors.primary,
      expandedAlignment: Alignment.topLeft,
      children: [
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
