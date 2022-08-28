import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_ordering_event.dart';
part 'list_ordering_state.dart';

class ListOrderingBloc extends Bloc<ListOrderingEvent, ListOrderingState> {
  final List<String> _orderingItems = ["A-Z", "Z-A"];
  ListOrderingBloc() : super(const ListOrderingInitialState()) {
    //initialize dropdownmenu
    on<FetchOrderingEvent>((event, emit) async {
      emit(const ListOrderingLoadingState());
      emit(ListOrderingLoadedState(orderingItems: _orderingItems));
    });
    //change dropdown state
    on<FetchOnChangeOrderingEvent>((event, emit) async {
      emit(ListOrderingLoadedState(orderingItems: _orderingItems));
      emit(ListOrderingOnChangedState(
          orderingItems: _orderingItems, selectedItem: event.selectedItem));
    });
  }
}
