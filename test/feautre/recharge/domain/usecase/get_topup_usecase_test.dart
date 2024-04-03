import 'package:da_assessment/core/errors/custom_error.dart';
import 'package:da_assessment/core/results/result.dart';
import 'package:da_assessment/feautre/recharge/domain/entity/topup_entity.dart';
import 'package:da_assessment/feautre/recharge/domain/repository/topup_repository.dart';
import 'package:da_assessment/feautre/recharge/domain/usecase/get_topup_option_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_topup_usecase_test.mocks.dart';

@GenerateMocks([TopUpRepository])
void main() {
  late GetTopUpsUseCase useCase;
  late MockTopUpRepository mockRepository;

  setUp(() {
    mockRepository = MockTopUpRepository();
    useCase = GetTopUpsUseCase(mockRepository);
  });

  final tTopUpResponse = TopUpResponseEntity(
    topUpOptions: [
      TopUpEntity(amount: 5, id: 1),
      TopUpEntity(amount: 10, id: 2),
      TopUpEntity(amount: 20, id: 3),
      TopUpEntity(amount: 30, id: 4),
    ],
  );
  final tParams = GetTopUpsParams();

  final error = CustomError(message: 'Failed to get top-up options');

  test('should get top-up options from repository', () async {
    // Arrange
    when(mockRepository.getTopUps(params: tParams)).thenAnswer((_) async => RemoteResult(data: tTopUpResponse));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect(result, isA<RemoteResult<TopUpResponseEntity>>());
    expect(result.data, tTopUpResponse);
    expect(result.hasDataOnly, true);
    verify(mockRepository.getTopUps(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return error when getting top-up options fails', () async {
    // Arrange
    when(mockRepository.getTopUps(params: tParams)).thenAnswer((_) async => RemoteResult(error: error));

    // Act
    final result = await useCase(params: tParams);

    // Assert
    expect((result.error), error);
    expect(result.hasErrorOnly, true);
    verify(mockRepository.getTopUps(params: tParams));
    verifyNoMoreInteractions(mockRepository);
  });
}
