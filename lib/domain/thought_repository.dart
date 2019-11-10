import 'package:golden_thoughts/domain/thought.dart';

abstract class ThoughtRepository {
  List<Thought> findAll();

  Thought save(Thought thought);
}