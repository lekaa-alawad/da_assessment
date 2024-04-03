import 'package:da_assessment/core/ui/custom_appbar.dart';
import 'package:da_assessment/core/ui/dialogs/dialogs.dart';
import 'package:da_assessment/core/utils/navigation.dart';
import 'package:da_assessment/feautre/home_page/cubits/home_page_cubit.dart';
import 'package:da_assessment/feautre/home_page/ui/widgets/mobile_recharge_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/ui/general_error_widget.dart';
import '../../../core/ui/loading.dart';
import '../../add_beneficary/domain/entity/topup_beneficiary_entity.dart';
import '../../add_beneficary/ui/add_beneficary_screen.dart';
import '../domain/entity/user_entity.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'HomePage',
        ),
        body: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetUserSuccessState) {
              return DefaultTabController(
                length: 2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildUserInfo(context.read<HomePageCubit>().userEntity, context),
                        const SizedBox(height: 16.0),
                        _buildBalance(context.read<HomePageCubit>().userEntity, context),
                        const SizedBox(height: 24.0),
                        buildBeneficiariesHeader(context),
                        const SizedBox(height: 8.0),
                        buildTabBar(),
                        buildTabBarView(context),
                        // _buildTopUpBeneficiaries(user),
                        const SizedBox(height: 16.0),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // Handle "Add Beneficiary" button press
                        //   },
                        //   child: const Text('Browse Beneficiaries'),
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is GetUserLoadingState) {
              return const Center(
                child: LoadingIndicator(),
              );
            } else if (state is GetUserErrorState) {
              return GeneralErrorWidget(
                message: state.error.toString(),
                onTap: () {
                  context.read<HomePageCubit>().getUser();
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }

  ConstrainedBox buildTabBarView(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 145),
      child: TabBarView(
        children: [
          MobileRechargeTab(
            topUpBeneficiaries: context.read<HomePageCubit>().userEntity.topUpBeneficiaries,
          ),
          MobileRechargeTab(
            topUpBeneficiaries: context.read<HomePageCubit>().userEntity.historyTopUpBeneficiaries ?? [],
          )
        ],
      ),
    );
  }

  Container buildTabBar() {
    return Container(
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))), color: Colors.white),
        ),
      ),
    );
  }

  Row buildBeneficiariesHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Top-Up Beneficiaries',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add Beneficiary',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          onTap: () {
            if (context.read<HomePageCubit>().userEntity.topUpBeneficiaries.length < 5) {
              Navigation.push(const AddBeneficiary())
                  ?.then((value) => context.read<HomePageCubit>().addBeneficiary(value as TopUpBeneficiaryEntity));
            } else {
              Dialogs.showErrorSnackBar(message: 'Can\'t add more than 5 Beneficiaries');
            }
          },
        )
      ],
    );
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
