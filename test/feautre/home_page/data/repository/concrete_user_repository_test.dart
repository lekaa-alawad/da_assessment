import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/home_page/data/data_source/user_remote_data_source.dart';
import 'package:da_assessment/feautre/home_page/data/model/user_model.dart';
import 'package:da_assessment/feautre/home_page/data/repository/concrete_user_repository.dart';
import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';
import 'package:da_assessment/feautre/home_page/domain/usecase/get_user_data_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_user_repository_test.mocks.dart';

@GenerateMocks([UserRemoteDataSource])
void main() {
  late ConcreteUserRepository repository;
  late MockUserRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockUserRemoteDataSource();
    repository = ConcreteUserRepository(remoteDataSource: mockRemoteDataSource);
  });

  final tUser = UserEntity(
      id: "1", email: 'test@example.com', isVerified: true, name: 'test', balance: 1000, topUpBeneficiaries: []);

  final tUserModel = UserModel(
      id: "1", email: 'test@example.com', isVerified: true, name: 'test', balance: 1000, topUpBeneficiaries: []);
  final tParams = GetUserParams();
  final error = CustomError(message: 'can\'t get Data');

  group('ConcreteUserRepository', () {
    test('should return UserEntity when login is successful', () async {
      // Arrange
      when(mockRemoteDataSource.getUser(tParams)).thenAnswer((_) async => Right(tUserModel));

      // Act
      final result = await repository.getUserData(params: tParams);

      // Assert
      expect(result.data, tUser);
      verify(mockRemoteDataSource.getUser(tParams));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return error when login fails', () async {
      // Arrange
      when(mockRemoteDataSource.getUser(tParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await repository.getUserData(params: tParams);

      // Assert
      expect((result).error, error);
      verify(mockRemoteDataSource.getUser(tParams));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
