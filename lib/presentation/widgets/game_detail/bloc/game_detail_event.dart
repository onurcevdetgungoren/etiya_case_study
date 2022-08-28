part of 'game_detail_bloc.dart';

abstract class GameDetailEvent extends Equatable {
  const GameDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchGameDetailEvent extends GameDetailEvent {
  final String id;
  const FetchGameDetailEvent({required this.id});
}
