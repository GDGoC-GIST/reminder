import 'package:get_it/get_it.dart';
import 'package:reminder/data/repositories/example_repository_impl.dart';
import 'package:reminder/domain/repositories/example_repository.dart';
import 'package:reminder/domain/usecases/example_usecase.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<ExampleRepository>(ExampleRepositoryImpl());

  getIt.registerSingleton<GetExampleUsecase>(GetExampleUsecase(
    exampleRepository: getIt<ExampleRepository>(),
  ));
}
