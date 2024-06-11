import 'package:flutter/material.dart';
import 'package:pokeworld/model/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Optional: add rounded corners
        side: const BorderSide(
          color: Colors.white,
          width: 1,
        ),
      ),
      color: Colors.black.withOpacity(.5),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.network(
            pokemon.imageUrl,
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18,
            color: Colors.white),
          )
        ],
      ),
    );
  }
}
