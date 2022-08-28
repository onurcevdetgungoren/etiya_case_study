part of 'game_detail_bloc.dart';

abstract class GameDetailState extends Equatable {
  const GameDetailState();

  @override
  List<Object> get props => [];
}

class GameDetailLoadingState extends GameDetailState {}

class GameDetailLoadedState extends GameDetailState {
  final GameDetail gameDetail;
  const GameDetailLoadedState({required this.gameDetail});
}

class GameDetailErrorState extends GameDetailState {}
