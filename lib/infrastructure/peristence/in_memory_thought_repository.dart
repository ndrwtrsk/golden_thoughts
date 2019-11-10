import 'package:golden_thoughts/domain/thought.dart';
import 'package:golden_thoughts/domain/thought_repository.dart';

class InMemoryThoughtRepository implements ThoughtRepository {
  Map<String, Thought> map = Map();

  @override
  List<Thought> findAll() {
    return map.values.toList(growable: false);
  }

  @override
  Thought save(Thought thought) {
    map[thought.id] = thought;
    return thought;
  }
}
