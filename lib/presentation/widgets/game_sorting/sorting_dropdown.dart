import 'package:etiya_case_study/presentation/widgets/custom_circular_indicator.dart';
import 'package:etiya_case_study/presentation/widgets/custom_dropdown.dart';
import 'package:etiya_case_study/presentation/widgets/game_list/bloc/game_bloc.dart';
import 'package:etiya_case_study/presentation/widgets/game_sorting/bloc/list_ordering_bloc.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class SortingDropdown extends StatelessWidget {
  final TextEditingController textController;
  const SortingDropdown({Key? key, required this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameBloc = BlocProvider.of<GameBloc>(context);
    final listOrderingBloc = BlocProvider.of<ListOrderingBloc>(context);
    return BlocBuilder<ListOrderingBloc, ListOrderingState>(
      bloc: listOrderingBloc,
      builder: (context, state) {
        if (state is ListOrderingInitialState) {}
        if (state is ListOrderingLoadingState) {
          return const CustomCircularIndicator();
        }
        if (state is ListOrderingLoadedState) {
          return CustomDropDown(
            pressed: <String>(s) {
              listOrderingBloc.add(FetchOnChangeOrderingEvent(selectedItem: s));

              gameBloc.add(FetchSortingEvent(
                  search: textController.text,
                  orderingItem: s == "A-Z" ? "name" : "-name"));
            },
            itemList: state.orderingItems,
            hintText: "Sort by",
            value: 0,
            isSorting: true,
          );
        }
        if (state is ListOrderingOnChangedState) {
          return Row(
            children: [
              CustomDropDown(
                pressed: <String>(s) {
                  listOrderingBloc
                      .add(FetchOnChangeOrderingEvent(selectedItem: s));
                  gameBloc.add(FetchSortingEvent(
                      search: textController.text,
                      orderingItem: s == "A-Z" ? "name" : "-name"));
                },
                itemList: state.orderingItems,
                hintText: "Sort by",
                value: state.selectedItem,
                isSorting: true,
              ),
              InkWell(
                  onTap: () {
                    listOrderingBloc.add(const FetchOrderingEvent());
                    gameBloc.add(FetchSortingEvent(
                        search: textController.text, orderingItem: ""));
                  },
                  child: const Icon(
                    Icons.cancel,
                    color: Colors.white60,
                  ))
            ],
          );
        }
        return Container();
      },
    );
  }
}
