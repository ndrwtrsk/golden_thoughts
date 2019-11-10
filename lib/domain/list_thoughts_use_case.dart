import 'package:golden_thoughts/domain/thought.dart';
import 'package:golden_thoughts/domain/thought_repository.dart';

abstract class ListThoughtsUseCase {
  List<Thought> thoughts();
}

class ListThoughtsUseCasePort implements ListThoughtsUseCase {
  
  ThoughtRepository _repo;
  
  ListThoughtsUseCasePort(this._repo);
  
  @override
  List<Thought> thoughts() {
    return _repo.findAll();
  }
  
}