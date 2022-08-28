part of 'list_ordering_bloc.dart';

abstract class ListOrderingEvent extends Equatable {
  const ListOrderingEvent();

  @override
  List<Object> get props => [];
}

class FetchOrderingEvent extends ListOrderingEvent {
  const FetchOrderingEvent();
}

class FetchOnChangeOrderingEvent extends ListOrderingEvent {
  final String selectedItem;
  const FetchOnChangeOrderingEvent({required this.selectedItem});
}
