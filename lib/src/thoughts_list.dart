import 'package:flutter/material.dart';
import 'package:golden_thoughts/domain/ListThoughtsUseCase.dart';
import 'package:golden_thoughts/domain/Thought.dart';

class ThoughtsList extends StatefulWidget {
  final ListThoughtsUseCase _useCase;

  ThoughtsList(this._useCase, {Key key}) : super(key: key);

  @override
  _ThoughtsListState createState() => _ThoughtsListState(_useCase);
}

class _ThoughtsListState extends State<ThoughtsList> {
  final ListThoughtsUseCase _useCase;

  _ThoughtsListState(this._useCase);

  @override
  Widget build(BuildContext context) {
    var thoughts = _useCase.thoughts();
    print(thoughts);
    return ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: thoughts.length,
        itemBuilder: (BuildContext context, int index) => _ThoughtListEntry.fromThought(thoughts[index]));
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
