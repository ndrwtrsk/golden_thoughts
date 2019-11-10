
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_thoughts/domain/Thought.dart';
import 'package:golden_thoughts/infrastructure/peristence/InMemoryThoughtRepository.dart';

void main() {
  test("should return thoughts", () {
    var repo = new InMemoryThoughtRepository();
    repo.save(Thought("Ethan", "Papa Bless"));
    repo.save(Thought("Hila", "wtf"));
    var thoughts = repo.findAll();
    expect(thoughts.length, 2);
  });
}