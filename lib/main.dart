import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeworld/blocs/pokemon_bloc.dart';
import 'package:pokeworld/blocs/pokemon_event.dart';
import 'package:pokeworld/repositories/pokemon_repositories.dart';
import 'package:pokeworld/screens/pokemon_details_screen.dart';
import 'package:pokeworld/screens/pokemon_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokeworld',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            PokemonBloc(PokemonRepository())..add(FetchPokemons()),
        child: const PokemonListScreen(),
      ),
      routes: {
        '/pokemonlistscreen': (context) => const PokemonListScreen(),
        '/pokemondetailscreen': (context) => const PokemonDetailScreen(),
      },
    );
  }
}
