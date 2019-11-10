import 'package:golden_thoughts/domain/thought.dart';
import 'package:golden_thoughts/domain/thought_repository.dart';

abstract class NewThoughtUseCase {
  Thought add(Thought thought);
}

class NewThoughtUseCasePort implements NewThoughtUseCase {

  final ThoughtRepository _repo;

  NewThoughtUseCasePort(this._repo);

  @override
  Thought add(Thought thought) => _repo.save(thought);
  
}