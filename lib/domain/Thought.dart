import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class Thought {

  String _id = new Uuid().v1();
  String _author;
  String _content;

  Thought(this._author, this._content);

  String get id => _id;
  String get author => _author;
  String get content => _content;

}