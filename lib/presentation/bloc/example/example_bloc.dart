import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/domain/usecases/example_usecase.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc({
    required GetExampleUsecase getExampleUsecase,
  })  : _getExampleUsecase = getExampleUsecase,
        super(ExampleInitial(a: 1)) {
    on<ExampleInitialEvent>(_onExampleInitialEvent);
  }

  final GetExampleUsecase _getExampleUsecase;
  void _onExampleInitialEvent(
      ExampleInitialEvent event, Emitter<ExampleState> emit) async {
    final example = await _getExampleUsecase.execute();
    emit(ExampleInitial(a: example.a));
  }
}
