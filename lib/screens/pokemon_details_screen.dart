import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokeworld/model/pokemon.dart';
import 'package:pokeworld/widgets/background_screen.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white,),
        title: Text(
          pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
          style: const TextStyle(color: Colors.white),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(pokemon.imageUrl,scale: .3,),
                  Text(
                    pokemon.name.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 40,color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/assets/height.png",
                            scale: 3,
                          ),
                          Column(
                             crossAxisAlignment:
                                          CrossAxisAlignment.start,
                            children: [
                              const Text(
                                          'Height',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,color: Colors.white),
                                        ),
                              Text(
                                pokemon.height.toString(),
                                style: const TextStyle(fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "lib/assets/weight.png",
                            scale: 3,
                          ),
                          Column(
                            crossAxisAlignment:
                                          CrossAxisAlignment.start,
                            children: [
                               const Text(
                                          'Weight',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,color: Colors.white),
                                        ),
                              Text(
                                pokemon.weight.toString(),
                                style: const TextStyle(fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/assets/pokeball.png",
                            scale: 3,
                          ),
                          Column(
                            crossAxisAlignment:
                                          CrossAxisAlignment.start,
                            children: [
                               const Text(
                                          'Type',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,color: Colors.white),
                                        ),
                              Text(
                                pokemon.types.join(', '),
                                style: const TextStyle(fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
