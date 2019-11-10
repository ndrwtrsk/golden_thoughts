import 'package:flutter/material.dart';
import 'package:golden_thoughts/domain/ListThoughtsUseCase.dart';
import 'package:golden_thoughts/domain/Thought.dart';
import 'package:golden_thoughts/infrastructure/peristence/InMemoryThoughtRepository.dart';
import 'package:golden_thoughts/src/thoughts_list.dart';

void main() {
  var repo = InMemoryThoughtRepository();
  [Thought("Andrii", "Good dog"), Thought("Andrew", "Beautiful dog"), Thought("Milena", "Sweet dog")]
      .forEach((thought) => repo.save(thought));
  var useCase = ListThoughts(repo);
  runApp(GoldenThoughtsApp(useCase));
}

class GoldenThoughtsApp extends StatelessWidget {
  final ListThoughts _useCase;
  GoldenThoughtsApp(this._useCase);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Golden Thoughts',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Golden Thoughts'),
          ),
          body: ThoughtsList(_useCase),
        ));
  }
}
