import 'package:flutter/material.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';

class JProfileMenuTitle extends StatelessWidget {
  const JProfileMenuTitle(
      {super.key,
      required this.icon,
      required this.title,
      this.trailing,
      this.onTap,
      required this.subtitle});

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      leading: Icon(icon, size: 28, color: JColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
