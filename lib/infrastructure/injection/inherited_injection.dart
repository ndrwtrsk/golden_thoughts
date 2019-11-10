import 'package:flutter/widgets.dart';
import 'package:golden_thoughts/domain/list_thoughts_use_case.dart';
import 'package:golden_thoughts/domain/new_thought_use_case.dart';
import 'package:golden_thoughts/domain/thought_repository.dart';
import 'package:golden_thoughts/infrastructure/peristence/in_memory_thought_repository.dart';

class InheritedInjection extends InheritedWidget {
  final Widget child;
  ThoughtRepository _thoughtRepo;
  ListThoughtsUseCase _listThoughtsUseCase;
  NewThoughtUseCase _newThoughtUseCase;

  InheritedInjection({Key key, this.child}) {
    _thoughtRepo = InMemoryThoughtRepository();
    _listThoughtsUseCase = ListThoughtsUseCasePort(_thoughtRepo);
    _newThoughtUseCase = NewThoughtUseCasePort(_thoughtRepo);
  }

  ThoughtRepository get thoughtRepo => _thoughtRepo;

  ListThoughtsUseCase get listThoughtsUseCase => _listThoughtsUseCase;

  NewThoughtUseCase get newThoughtUseCase => _newThoughtUseCase;


  static InheritedInjection of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedInjection)
          as InheritedInjection;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
