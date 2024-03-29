import 'package:flutter/material.dart';
import 'package:golden_thoughts/domain/thought.dart';
import 'package:golden_thoughts/infrastructure/injection/inherited_injection.dart';

class ThoughtsList extends StatefulWidget {
  @override
  _ThoughtsListState createState() => _ThoughtsListState();
}

class _ThoughtsListState extends State<ThoughtsList> {
  @override
  Widget build(BuildContext context) {
    var useCase = InheritedInjection.of(context).listThoughtsUseCase;
    var thoughts = useCase.thoughts();
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: thoughts.length,
        itemBuilder: (BuildContext context, int index) =>
            _ThoughtListEntry.fromThought(thoughts[index]));
  }
}

class _ThoughtListEntry extends StatelessWidget {
  final String _author;
  final String _content;

  _ThoughtListEntry(this._author, this._content);

  _ThoughtListEntry.fromThought(Thought thought)
      : this(thought.author, thought.content);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text("$_content"),
        subtitle: Text("$_author"),
      );
}
