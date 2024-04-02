import 'package:da_assessment/feautre/home_page/ui/widgets/recharge_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/ui/no_data_widget.dart';
import '../../../add_beneficary/domain/entity/topup_beneficiary_entity.dart';

class MobileRechargeTab extends StatelessWidget {
  const MobileRechargeTab({super.key, required this.topUpBeneficiaries});

  final List<TopUpBeneficiaryEntity> topUpBeneficiaries;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.sw,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: topUpBeneficiaries.isNotEmpty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topUpBeneficiaries.length,
                itemBuilder: (context, index) => RechargeCard(
                      name: topUpBeneficiaries[index].nickname,
                      number: topUpBeneficiaries[index].phoneNumber,
                    ))
            : const NoDataWidget(),
      ),
    );
  }
}
