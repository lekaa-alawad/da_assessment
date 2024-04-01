import 'package:flutter/material.dart';

import '../../../../core/ui/theme/app_theme.dart';

class RechargeCard extends StatelessWidget {
  final String name;
  final String number;

  const RechargeCard({super.key, required this.name, required this.number});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 8,
      shadowColor: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4.0),
            Text(
              number,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryContainer, primaryContainer.withOpacity(0.4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.6, 1.0],
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 25.0),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    // Implement recharge functionality
                  },
                  child: Text(
                    'Recharge now',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
