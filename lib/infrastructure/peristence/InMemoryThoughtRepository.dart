import 'package:golden_thoughts/domain/Thought.dart';
import 'package:golden_thoughts/domain/ThoughtRepository.dart';

class InMemoryThoughtRepository implements ThoughtRepository {


  Map<String, Thought> map = Map();

  @override
  List<Thought> findAll() {
    return map.values.toList(growable: false);
  }

  Thought save(Thought thought) {
    map[thought.id] = thought;
    return thought;
  }

}