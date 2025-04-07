import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminder/core/injection_container.dart';
import 'package:reminder/domain/usecases/example_usecase.dart';
import 'package:reminder/presentation/bloc/example/example_bloc.dart';
import 'package:reminder/presentation/page/example/example_view.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExampleBloc(
        getExampleUsecase: getIt<GetExampleUsecase>(),
      ),
      child: const ExampleView(),
    );
  }
}
