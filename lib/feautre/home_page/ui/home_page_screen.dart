import 'package:da_assessment/core/boilerplate/get_model/widgets/get_model.dart';
import 'package:da_assessment/core/ui/custom_appBar.dart';
import 'package:da_assessment/feautre/home_page/domain/usecase/get_user_data_usecase.dart';
import 'package:da_assessment/feautre/home_page/ui/widgets/mobile_recharge_tab.dart';
import 'package:da_assessment/main.dart';
import 'package:flutter/material.dart';

import '../data/repository/concrete_user_repository.dart';
import '../domain/entity/user_entity.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'HomePage'),
        body: GetModel<UserEntity>(
          useCaseCallBack: () => GetUserUseCase(getIt.get<ConcreteUserRepository>()).call(params: GetUserParams()),
          modelBuilder: (UserEntity user) {
            return DefaultTabController(
              length: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildUserInfo(user, context),
                      const SizedBox(height: 16.0),
                      _buildBalance(user, context),
                      const SizedBox(height: 24.0),
                      Text(
                        'Top-Up Beneficiaries',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TabBar(
                            tabs: const [
                              Tab(text: 'Recharge'),
                              Tab(text: 'History'),
                            ],
                            unselectedLabelColor: Colors.black,
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.grey.shade300,
                            labelColor: Colors.blue,
                            indicator: const ShapeDecoration(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))),
                                color: Colors.white),
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 145),
                        child: TabBarView(
                          children: [
                            MobileRechargeTab(
                              topUpBeneficiaries: user.topUpBeneficiaries,
                            ),
                            MobileRechargeTab(
                              topUpBeneficiaries: user.historyTopUpBeneficiaries ?? [],
                            )
                          ],
                        ),
                      ),
                      // _buildTopUpBeneficiaries(user),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Handle "Add Beneficiary" button press
                        },
                        child: const Text('Browse Beneficiaries'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget _buildUserInfo(UserEntity user, BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40.0,
          child: Icon(
            Icons.person,
            size: 50.0,
          ),
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${user.name}!',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 4.0),
            Text(
              'Verification Status: ${user.isVerified ? 'Verified' : 'Not Verified'}',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: user.isVerified ? Colors.green : Colors.red,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBalance(UserEntity user, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Balance',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'AED ${user.balance.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
