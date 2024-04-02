import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/log_in/data/data_source/concrete_auth_datasource.dart';
import 'package:da_assessment/feautre/log_in/data/model/login_response_model.dart';
import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_auth_remote_datasource_test.mocks.dart';

@GenerateMocks([ConcreteAuthRemoteDataSource])
void main() {
  late ConcreteAuthRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockConcreteAuthRemoteDataSource();
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  final tUserModel = LoginResponseModel(id: '1', email: "tEmail", name: "tName", token: '1');
  final tParams = LogInParams(email: tEmail, password: tPassword);
  final error = CustomError(message: 'Failed to login');

  group('ConcreteUserRemoteDataSource', () {
    test('should return UserModel when login is successful', () async {
      // Arrange
      when(dataSource.login(tParams)).thenAnswer((_) async => Right(tUserModel));

      // Act
      final result = await dataSource.login(tParams);

      // Assert
      expect(result, isA<Right<BaseError, LoginResponseModel>>());
      verify(dataSource.login(tParams));
      verifyNoMoreInteractions(dataSource);
    });

    test('should return BaseError when login fails', () async {
      // Arrange
      when(dataSource.login(tParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await dataSource.login(tParams);

      // Assert
      expect(result, isA<Left<BaseError, LoginResponseModel>>());
      expect(result.isLeft(), true);
      verify(dataSource.login(tParams));
      verifyNoMoreInteractions(dataSource);
    });
  });
}
