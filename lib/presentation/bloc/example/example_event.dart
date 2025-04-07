part of 'example_bloc.dart';

abstract class ExampleEvent extends Equatable {}

class ExampleInitialEvent extends ExampleEvent {
  final int a;
  ExampleInitialEvent({required this.a});
  @override
  List<Object?> get props => [a];
}
