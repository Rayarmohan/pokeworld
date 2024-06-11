import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeworld/blocs/pokemon_event.dart';
import 'package:pokeworld/blocs/pokemon_state.dart';
import 'package:pokeworld/repositories/pokemon_repositories.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository repository;

  PokemonBloc(this.repository) : super(PokemonInitial()) {
    on<FetchPokemons>(_onFetchPokemons);
  }

  void _onFetchPokemons(FetchPokemons event, Emitter<PokemonState> emit) async {
    emit(PokemonLoading());
    try {
      final pokemons = await repository.fetchPokemons();
      emit(PokemonLoaded(pokemons));
    } catch (e) {
      emit(PokemonError(e.toString()));
    }
  }
}
