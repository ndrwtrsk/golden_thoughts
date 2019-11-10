import 'package:golden_thoughts/domain/Thought.dart';

abstract class ThoughtRepository {
  List<Thought> findAll();
}