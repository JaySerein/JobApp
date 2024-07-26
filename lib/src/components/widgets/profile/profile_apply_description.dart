import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';

class JProfileApplyDescription extends StatelessWidget {
  const JProfileApplyDescription({
    super.key,
    required this.title,
    required this.description,
    this.isEnble = false,
  });

  final String title, description;
  final bool isEnble;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: isEnble,
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
