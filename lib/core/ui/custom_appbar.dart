import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool? centerTitle;

  const CustomAppBar({super.key, required this.title, this.actions, this.centerTitle});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
      ),
      centerTitle: centerTitle ?? true,
      actions: actions,
    );
  }
}
