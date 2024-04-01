import 'package:da_assessment/feautre/log_in/ui/login_screen.dart';
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

final getIt = GetIt.instance;

void diSetup() {
  //Mock Backend
  getIt.registerLazySingleton(() => BackEndService());

  //data sources
  getIt.registerLazySingleton(() => ConcreteUserRemoteDataSource());
  getIt.registerLazySingleton(() => ConcreteAuthRemoteDataSource());

  //repositories
  getIt.registerLazySingleton(() => ConcreteUserRepository(remoteDataSource: ConcreteUserRemoteDataSource()));
  getIt.registerLazySingleton(() => ConcreteAuthRepository(remoteDataSource: ConcreteAuthRemoteDataSource()));
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
