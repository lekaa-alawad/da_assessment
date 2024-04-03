import 'package:da_assessment/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:da_assessment/core/ui/loading.dart';
import 'package:da_assessment/core/ui/theme/decorations.dart';
import 'package:da_assessment/feautre/recharge/cubit/recharge_cubit.dart';
import 'package:da_assessment/feautre/recharge/data/repository/concrete_topup_repository.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/get_topup_option_usecase.dart';
import 'package:da_assessment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home_page/cubits/home_page_cubit.dart';

class RechargeDialog extends StatelessWidget {
  const RechargeDialog({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    TopUpEntity? rechargeAmount;
    final cubit = RechargeCubit();
    return GetModel(
      useCaseCallBack: () => GetTopUpsUseCase(getIt.get<ConcreteTopUpRepository>()).call(params: GetTopUpsParams()),
      modelBuilder: (TopUpResponseEntity model) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              RechargeDropDown(
                items: model.topUpOptions,
                onChanged: (value) => rechargeAmount = value,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer(
                bloc: cubit,
                builder: (context, state) {
                  if (state is RechargeLoading) {
                    return const LoadingIndicator();
                  }
                  return InkWell(
                    onTap: () {
                      cubit.recharge(
                        beneficiaryId: id,
                        rechargeAmount: rechargeAmount,
                        userEntity: context.read<HomePageCubit>().userEntity,
                      );
                    },
                    child: DecoratedBox(
                      decoration: buttonDecoration,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                        child: Text(
                          'Submit',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
                listener: (context, state) {
                  if (state is RechargeSuccess) {
                    context.read<HomePageCubit>().getUser();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

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
