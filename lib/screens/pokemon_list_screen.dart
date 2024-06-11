import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeworld/blocs/pokemon_bloc.dart';
import 'package:pokeworld/blocs/pokemon_state.dart';
import 'package:pokeworld/widgets/background_screen.dart';
import 'package:pokeworld/widgets/pokemon_card.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Pokemon List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: SizedBox(
        child: Stack(
          children: [
            const BackgroundScreen(),
            BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
              if (state is PokemonLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (state is PokemonLoaded) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    // childAspectRatio: 1, // Aspect ratio of each item
                    crossAxisSpacing: 5, // Horizontal spacing between items
                    mainAxisSpacing: 5, // Vertical spacing between items
                  ),
                  padding: const EdgeInsets.all(10),
                  itemCount: state.pokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = state.pokemons[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/pokemondetailscreen',arguments: pokemon);
                      },
                      child: PokemonCard(
                        pokemon: pokemon,
                      ),
                    );
                  },
                );
              } else if (state is PokemonError) {
                return Center(child: Text(state.message));
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
