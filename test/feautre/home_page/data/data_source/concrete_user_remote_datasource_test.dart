import 'package:da_assessment/core/errors/base_error.dart';
import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/feautre/home_page/data/data_source/concrete_user_remote_datasource.dart';
import 'package:da_assessment/feautre/home_page/data/model/user_model.dart';
import 'package:da_assessment/feautre/home_page/domain/usecase/get_user_data_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'concrete_user_remote_datasource_test.mocks.dart';

@GenerateMocks([ConcreteUserRemoteDataSource])
void main() {
  late ConcreteUserRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockConcreteUserRemoteDataSource();
  });
  final tUserModel = UserModel(
      id: "1", email: 'test@example.com', isVerified: true, name: 'test', balance: 1000, topUpBeneficiaries: []);

  final tParams = GetUserParams();
  final error = CustomError(message: 'can\'t get Data');

  group('ConcreteUserRemoteDataSource', () {
    test('should return UserModel when getting user data is successful', () async {
      // Arrange
      when(dataSource.getUser(tParams)).thenAnswer((_) async => Right(tUserModel));

      // Act
      final result = await dataSource.getUser(tParams);

      // Assert

      verify(dataSource.getUser(tParams));
      verifyNoMoreInteractions(dataSource);
      expect(result, isA<Right<BaseError, UserModel>>());

      verifyNoMoreInteractions(dataSource);
    });

    test('should return BaseError when getting user data fails', () async {
      // Arrange

      when(dataSource.getUser(tParams)).thenAnswer((_) async => Left(error));

      // Act
      final result = await dataSource.getUser(tParams);

      // Assert

      expect(result, isA<Left<BaseError, UserModel>>());
      expect(result.isLeft(), true);
      verify(dataSource.getUser(tParams));
      verifyNoMoreInteractions(dataSource);
    });
  });
}
