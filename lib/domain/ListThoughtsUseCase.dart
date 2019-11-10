import 'package:golden_thoughts/domain/Thought.dart';
import 'package:golden_thoughts/domain/ThoughtRepository.dart';

abstract class ListThoughtsUseCase {
  List<Thought> thoughts();
}

class ListThoughts implements ListThoughtsUseCase {
  
  ThoughtRepository _repo;
  
  ListThoughts(this._repo);
  
  @override
  List<Thought> thoughts() {
    return _repo.findAll();
  }
  
}