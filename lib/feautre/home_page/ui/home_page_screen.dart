import 'package:da_assessment/core/ui/custom_appBar.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'HomePage'),
      body: Placeholder(),
    );
  }
}
