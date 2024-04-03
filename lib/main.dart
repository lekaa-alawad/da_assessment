import 'package:da_assessment/feautre/add_beneficary/data/data_source/concrete_beneficiary_datasource.dart';
import 'package:da_assessment/feautre/add_beneficary/data/repository/beneficiary_reopsitory.dart';
import 'package:da_assessment/feautre/recharge/data/data_source/concrete_topup_remote_datasource.dart';
import 'package:da_assessment/feautre/recharge/data/repository/concrete_topup_repository.dart';
import 'package:da_assessment/feautre/transaction_history/data/data_source/concrete_transaction_remote_datasource.dart';
import 'package:da_assessment/feautre/transaction_history/data/repository/concrete_transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'core/http/mock_backend.dart';
import 'core/ui/theme/app_theme.dart';
import 'core/utils/keys.dart';
import 'feautre/home_page/data/data_source/concrete_user_remote_datasource.dart';
import 'feautre/home_page/data/repository/concrete_user_repository.dart';
import 'feautre/log_in/data/data_source/concrete_auth_datasource.dart';
import 'feautre/log_in/data/repository/concrete_auth_repository.dart';
import 'feautre/log_in/ui/login_screen.dart';

final getIt = GetIt.instance;

void diSetup() {
  //Mock Backend
  getIt.registerLazySingleton(() => BackEndService());

  //data sources
  getIt.registerLazySingleton(() => ConcreteUserRemoteDataSource());
  getIt.registerLazySingleton(() => ConcreteAuthRemoteDataSource());
  getIt.registerLazySingleton(() => ConcreteBeneficiaryRemoteDataSource());
  getIt.registerLazySingleton(() => ConcreteTopUpRemoteDataSource());
  getIt.registerLazySingleton(() => ConcreteTransactionRemoteDataSource());

  //repositories
  getIt.registerLazySingleton(
    () => ConcreteUserRepository(
      remoteDataSource: getIt.get<ConcreteUserRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton(
    () => ConcreteTransactionRepository(
      transactionRemoteDataSource: getIt.get<ConcreteTransactionRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton(
    () => ConcreteTopUpRepository(
      remoteDataSource: getIt.get<ConcreteTopUpRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton(
    () => ConcreteAuthRepository(
      remoteDataSource: getIt.get<ConcreteAuthRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton(
    () => ConcreteBeneficiaryRepository(
      dataSource: getIt.get<ConcreteBeneficiaryRemoteDataSource>(),
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  diSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: Keys.navigatorKey,
          title: 'Da Studio Assessment',
          theme: appThemeData,
          home: const LoginScreen(),
        );
      },
    );
  }
}
