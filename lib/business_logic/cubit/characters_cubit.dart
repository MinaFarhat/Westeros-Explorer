import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:westerosexplorer/data/models/character.dart';
import 'package:westerosexplorer/data/repository/characters_repository.dart';


part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepositry charactersRepositry;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepositry) : super(CharctersInitial());

  List<Character> getAllCharacters() {
    charactersRepositry.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
