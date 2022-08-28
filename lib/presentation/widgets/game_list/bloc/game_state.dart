part of 'game_bloc.dart';

@immutable
abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitialState extends GameState {
  const GameInitialState();
}

class GameLoadingState extends GameState {
  const GameLoadingState();
}

class GameLoadedState extends GameState {
  final Game? game;
  final bool? hasMore;
  final List<Result> gameList;

  const GameLoadedState({
    required this.game,
    required this.hasMore,
    required this.gameList,
  });
}

class GameErrorState extends GameState {}

class GamePaginationState extends GameState {
  final Game? game;
  final bool? hasMore;
  final List<Result> gameList;
  const GamePaginationState(
      {required this.game, required this.hasMore, required this.gameList});
}
