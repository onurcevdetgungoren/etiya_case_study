part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

//search
class FetchGameEvent extends GameEvent {
  final String search;
  const FetchGameEvent({
    required this.search,
  });
}

//filter
class FetchFilterEvent extends GameEvent {
  final String search;
  final int platformId;
  const FetchFilterEvent({required this.search, required this.platformId});
}

//ordering
class FetchSortingEvent extends GameEvent {
  final String search;
  final String orderingItem;
  const FetchSortingEvent({required this.search, required this.orderingItem});
}

//pagination
class FetchPaginationEvent extends GameEvent {
  final String search;
  const FetchPaginationEvent({required this.search});
}
