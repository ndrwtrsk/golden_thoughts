import 'package:flutter/widgets.dart';
import 'package:golden_thoughts/domain/ListThoughtsUseCase.dart';
import 'package:golden_thoughts/domain/ThoughtRepository.dart';
import 'package:golden_thoughts/infrastructure/peristence/InMemoryThoughtRepository.dart';

class InheritedInjection extends InheritedWidget {
  final Widget child;
  ThoughtRepository _thoughtRepo;
  ListThoughtsUseCase _listThoughtsUseCase;

  InheritedInjection({Key key, this.child}) {
    _thoughtRepo = InMemoryThoughtRepository();
    _listThoughtsUseCase = ListThoughts(_thoughtRepo);
  }

  ThoughtRepository get thoughtRepo => _thoughtRepo;

  ListThoughtsUseCase get listThoughtsUseCase => _listThoughtsUseCase;

  static InheritedInjection of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedInjection)
          as InheritedInjection;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
