import 'package:westerosexplorer/data/api/charactersapi.dart';
import 'package:westerosexplorer/data/models/character.dart';
class CharactersRepositry {
  final CharactersApi charactersApi;

  CharactersRepositry(this.charactersApi);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersApi.getAllCharacters();

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
