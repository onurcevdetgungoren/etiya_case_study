part of 'list_ordering_bloc.dart';

abstract class ListOrderingState extends Equatable {
  const ListOrderingState();

  @override
  List<Object> get props => [];
}

class ListOrderingInitialState extends ListOrderingState {
  const ListOrderingInitialState();
}

class ListOrderingLoadingState extends ListOrderingState {
  const ListOrderingLoadingState();
}

class ListOrderingLoadedState extends ListOrderingState {
  final List<String> orderingItems;
  const ListOrderingLoadedState({required this.orderingItems});
}

class ListOrderingOnChangedState extends ListOrderingState {
  final List<String> orderingItems;
  final String selectedItem;
  const ListOrderingOnChangedState(
      {required this.orderingItems, required this.selectedItem});
}
