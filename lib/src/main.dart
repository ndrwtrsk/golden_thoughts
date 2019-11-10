import 'package:flutter/material.dart';
import 'package:golden_thoughts/domain/thought.dart';
import 'package:golden_thoughts/infrastructure/injection/inherited_injection.dart';
import 'package:golden_thoughts/infrastructure/peristence/in_memory_thought_repository.dart';
import 'package:golden_thoughts/src/new_thought.dart';
import 'package:golden_thoughts/src/thoughts_list.dart';

void main() {
  runApp(GoldenThoughtsApp());
}

class GoldenThoughtsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var injector = InheritedInjection(
      child: MaterialApp(
        title: 'Golden Thoughts',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: GoldenThoughtsScaffold(),
      ),
    );
    var repo = injector.thoughtRepo as InMemoryThoughtRepository;
    [
      Thought("Andrii", "Good dog"),
      Thought("Andrew", "Beautiful dog"),
      Thought("Milena", "Sweet dog")
    ].forEach((thought) => repo.save(thought));
    return injector;
  }
}

class GoldenThoughtsScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Golden Thoughts'),
        ),
        body: ThoughtsList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewThought()));
          },
          tooltip: "Add new thought",
          child: Icon(Icons.add),
        ),
      );
}
