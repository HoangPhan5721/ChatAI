import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/number_trivia_repository_impl.dart';
import '../binding/number_trivia_binding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NumberTriviaPage extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const NumberTriviaPage({super.key, required this.sharedPreferences});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    final repository = NumberTriviaRepositoryImpl(
      remoteDataSource: NumberTriviaRemoteDataSourceImpl(client:http.Client()),
      localDataSource: NumberTriviaLocalDataSourceImpl(sharedPreferences: sharedPreferences),
    );
    return BlocProvider(
      create: (_) => NumberTriviaBinding.createBloc(repository),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              // Top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: 'Start searching!',
                    );
                  }
                  else if (state is Loading) {
                    return LoadingWidget();
                  }
                  else if (state is Loaded) {
                    return TriviaDisplay(numberTrivia: state.trivia);
                  }
                  else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }

                  return SizedBox.shrink();
                },
              ),
              SizedBox(height: 20),
              // Bottom half
              TriviaControls()
            ],
          ),
        ),
      ),
    );
  }

}
