import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(4),
      child: ListTile(
        title: Text(title, style: theme.textTheme.titleLarge),
        subtitle: Text(subtitle, style: theme.textTheme.titleSmall),
      ),
    );
  }
}
