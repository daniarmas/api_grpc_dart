import 'package:api_grpc_dart/core/usecases/usecase.dart';
import 'package:api_grpc_dart/domain/repositories/business_repository.dart';
import 'package:api_grpc_dart/domain/usecases/list_business.dart';
import 'package:api_grpc_dart/grpc/protos/main.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import '../usecases/list_business_test.mocks.dart';

@GenerateMocks([BusinessRepository])
void main() {
  late ListBusinessUseCase usecase;
  late MockBusinessRepository mockBusinessRepository;
  setUp(() {
    mockBusinessRepository = MockBusinessRepository();
    usecase = ListBusinessUseCase(mockBusinessRepository);
  });

  final List<Business> listOfBusiness = [Business(id: '1', name: 'imandra')];

  test('should get a list of business from the repository', () async {
    // arrange
    when(mockBusinessRepository.listBusiness())
        .thenAnswer((_) async => Right(listOfBusiness));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, Right(listOfBusiness));
    verify(mockBusinessRepository.listBusiness());
    verifyNoMoreInteractions(mockBusinessRepository);
  });
}
