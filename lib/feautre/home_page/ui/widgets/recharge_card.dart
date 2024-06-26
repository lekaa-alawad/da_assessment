import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/dialogs/dialogs.dart';
import '../../../../core/ui/theme/decorations.dart';
import '../../../recharge/ui/recharge_ui.dart';
import '../../cubits/home_page_cubit.dart';

class RechargeCard extends StatelessWidget {
  final String name;
  final String number;
  final int id;

  const RechargeCard({super.key, required this.name, required this.number, required this.id});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 8,
      shadowColor: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              decoration: buttonDecoration,
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 25.0),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Dialogs.showQuestion(
                      context,
                      title: "Recharge",
                      subtitle: "Choose the amount to recharge",
                      content: BlocProvider.value(
                        value: context.read<HomePageCubit>(),
                        child: RechargeDialog(id: id),
                      ),
                    );
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
