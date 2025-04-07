import 'package:reminder/domain/entities/example.dart';

import '../repositories/example_repository.dart';

class GetExampleUsecase {
  final ExampleRepository exampleRepository;
  GetExampleUsecase({required this.exampleRepository});
  Future<Example> execute() async {
    return await exampleRepository.getExample();
  }
}
