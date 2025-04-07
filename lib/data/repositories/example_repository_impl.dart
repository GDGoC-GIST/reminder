import 'package:reminder/domain/entities/example.dart';
import 'package:reminder/domain/repositories/example_repository.dart';

class ExampleRepositoryImpl extends ExampleRepository {
  @override
  Future<Example> getExample() async {
    return Example(a: 1);
  }
}
