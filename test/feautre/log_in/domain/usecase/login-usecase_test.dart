import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/log_in/domain/entity/login_response_entity.dart';
import 'package:da_assessment/feautre/log_in/domain/repository/auth_repository.dart';
import 'package:da_assessment/feautre/log_in/domain/usecase/log_in_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login-usecase_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late LogInUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LogInUseCase(mockRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  final tUser = LoginResponseEntity('1', "tEmail", "tName", 'token');
  final tParams = LogInParams(email: tEmail, password: tPassword);
  final error = CustomError(message: 'Failed to login');

  group('login usecase tests', () {
    test('should get user from repository when login is successful', () async {
      // Arrange
      when(mockRepository.login(params: tParams)).thenAnswer((_) async => RemoteResult(data: tUser));

      // Act
      final result = await useCase(params: tParams);

      // Assert
      expect(result, isA<RemoteResult<LoginResponseEntity>>());
      expect(result.data, tUser);
      expect(result.hasDataOnly, true);
      verify(mockRepository.login(params: tParams));
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return error when login fails', () async {
      // Arrange
      when(mockRepository.login(params: tParams)).thenAnswer((_) async => RemoteResult(error: error));

      // Act
      final result = await useCase(params: tParams);

      // Assert
      expect((result).error, error);
      expect(result.hasErrorOnly, true);
      verify(mockRepository.login(params: tParams));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
