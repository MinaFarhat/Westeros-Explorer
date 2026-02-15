import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:westerosexplorer/business_logic/cubit/characters_cubit.dart';
import 'package:westerosexplorer/constants/strings.dart';
import 'package:westerosexplorer/data/api/charactersapi.dart';
import 'package:westerosexplorer/data/models/character.dart';
import 'package:westerosexplorer/data/repository/characters_repository.dart';
import 'package:westerosexplorer/presentation/screens/character_details.dart';
import 'presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepositry charactersRepositry;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepositry = CharactersRepositry(CharactersApi());
    charactersCubit = CharactersCubit(charactersRepositry);
  }

  Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (BuildContext context) =>CharactersCubit(charactersRepositry),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
    return null;
  }
}
