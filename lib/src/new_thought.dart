import 'package:flutter/material.dart';
import 'package:golden_thoughts/domain/thought.dart';
import 'package:golden_thoughts/infrastructure/injection/inherited_injection.dart';

class NewThought extends StatefulWidget {
  NewThought({Key key}) : super(key: key);

  @override
  _NewThoughtState createState() => _NewThoughtState();
}

class _NewThoughtState extends State<NewThought> {
  final _formKey = GlobalKey<FormState>();

  final authorController = TextEditingController();
  final contentController = TextEditingController();

  validateAndSave(BuildContext buildContext) {
    return () {
      if (!_formKey.currentState.validate()) {
        return;
      }
      var useCase = InheritedInjection.of(context).newThoughtUseCase;
      var content = contentController.text;
      var author = authorController.text;
      var thought = Thought(author, content);
      useCase.add(thought);
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("New thought"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: validateAndSave(context),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: contentController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Add the thought at least...';
                  }
                  return null;
                },
                minLines: 5,
                maxLines: 20,
                decoration: InputDecoration(hintText: "What's the thought?"),
              ),
              TextFormField(
                  controller: authorController,
                  decoration: InputDecoration(hintText: "Who's the author?")),
            ],
          ),
        ),
      ));
}
