import 'package:golden_thoughts/domain/ListThoughtsUseCase.dart';
import 'package:golden_thoughts/infrastructure/peristence/PersistenceDependencies.dart';

class ThoughtsDependencies {

  static ListThoughtsUseCase listThoughtsUseCase() => ListThoughts(PersistenceDependencies.thoughtRepository());

}