import 'package:flutter/material.dart';

import '../domain/entity/topup_entity.dart';

class RechargeDropDown extends StatefulWidget {
  const RechargeDropDown({super.key, required this.items, required this.onChanged});
  final List<TopUpEntity> items;
  final ValueChanged<TopUpEntity> onChanged;

  @override
  State<RechargeDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<RechargeDropDown> {
  TopUpEntity? topUpEntity;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<TopUpEntity>(
      iconSize: 20.0,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      isExpanded: true,
      value: topUpEntity,
      hint: const Text(
        'Select Recharge Amount',
      ),
      items: widget.items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text("${e.amount} AUE"),
              ))
          .toList(),
      onChanged: (topUpEntity) {
        setState(() => this.topUpEntity = topUpEntity!);
        widget.onChanged(topUpEntity!);
      },
    );
  }
}
