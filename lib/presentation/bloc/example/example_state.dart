part of 'example_bloc.dart';

abstract class ExampleState extends Equatable {}

class ExampleInitial extends ExampleState {
  final int a;

  ExampleInitial({required this.a});
  @override
  List<Object?> get props => [a];
}
