import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/log_in/data/data_source/auth_remote_datasource.dart';
import 'package:da_assessment/feautre/log_in/data/model/login_response_model.dart';
import 'package:da_assessment/feautre/log_in/data/repository/concrete_auth_repository.dart';
import 'package:da_assessment/feautre/log_in/domain/entity/login_response_entity.dart';
import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_auth_repository_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource])
void main() {
  late ConcreteAuthRepository repository;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = ConcreteAuthRepository(remoteDataSource: mockRemoteDataSource);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  final tUser = LoginResponseEntity('1', "tEmail", "tName", 'token');
  final tUserModel = LoginResponseModel(id: '1', email: "tEmail", name: "tName", token: 'token');
  final tParams = LogInParams(email: tEmail, password: tPassword);
  final error = CustomError(message: 'Failed to login');

  group('ConcreteUserRepository', () {
    test('should return UserEntity when login is successful', () async {
      // Arrange
      when(mockRemoteDataSource.login(tParams)).thenAnswer((_) async => Right(tUserModel));

      // Act
      final result = await repository.login(params: tParams);

      // Assert
      expect(result.data, tUser);
      verify(mockRemoteDataSource.login(tParams));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return error when login fails', () async {
      // Arrange
      when(mockRemoteDataSource.login(tParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await repository.login(params: tParams);

      // Assert
      expect((result).error, error);
      verify(mockRemoteDataSource.login(tParams));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
