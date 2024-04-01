import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/home_page/domain/entity/user_entity.dart';
import 'package:da_assessment/feautre/home_page/domain/repository/user_repository.dart';
import 'package:da_assessment/feautre/home_page/domain/usecase/get_user_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_usecase_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late GetUserUseCase useCase;
  late MockUserRepository mockRepository;

  setUp(() {
    mockRepository = MockUserRepository();
    useCase = GetUserUseCase(mockRepository);
  });

  final tUser = UserEntity(
      id: "1", email: 'test@example.com', isVerified: true, name: 'test', balance: 1000, topUpBeneficiaries: []);
  final tParams = GetUserParams();
  final error = CustomError(message: 'can\'t get Data');

  test('should get user data from repository', () async {
    // Arrange
    when(mockRepository.getUserData(params: tParams)).thenAnswer((_) async => RemoteResult(data: tUser));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect(result, isA<RemoteResult<UserEntity>>());
    expect(result.data, tUser);
    verify(mockRepository.getUserData(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });
  //
  test('should return error when getting user data fails', () async {
    // Arrange
    when(mockRepository.getUserData(params: tParams)).thenAnswer((_) async => RemoteResult(error: error));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect((result).error, error);
    expect(result.hasErrorOnly, true);
    verify(mockRepository.getUserData(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });
}
