import 'package:clean_architecture_tdd_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_tdd_course/core/util/input_converter.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

import '../bloc/number_trivia_state.dart';


class NumberTriviaBinding {
  static NumberTriviaBloc createBloc(NumberTriviaRepository repository){
    final inputConverter = InputConverter();
    final getRandom = GetRandomNumberTrivia(repository);
    final getConcrete= GetConcreteNumberTrivia(repository);

    return NumberTriviaBloc(
      Empty(),
      concrete: getConcrete ,
      random: getRandom,
      inputConverter: inputConverter,
    );
  }
}