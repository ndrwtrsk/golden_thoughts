import 'package:golden_thoughts/domain/ThoughtRepository.dart';
import 'package:golden_thoughts/infrastructure/peristence/InMemoryThoughtRepository.dart';

class PersistenceDependencies {
  static ThoughtRepository thoughtRepository() => InMemoryThoughtRepository();
}