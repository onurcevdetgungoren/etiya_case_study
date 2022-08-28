import 'package:etiya_case_study/presentation/widgets/custom_dropdown.dart';
import 'package:etiya_case_study/presentation/widgets/game_filter/bloc/platform_filter_bloc.dart';
import 'package:etiya_case_study/presentation/widgets/game_list/bloc/game_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterDropdown extends StatelessWidget {
  final TextEditingController textEditingController;
  const FilterDropdown({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameBloc = BlocProvider.of<GameBloc>(context);
    final platformFilterBloc = BlocProvider.of<PlatformFilterBloc>(context);
    return BlocBuilder<PlatformFilterBloc, PlatformFilterState>(
      bloc: platformFilterBloc,
      builder: (context, state) {
        if (state is PlatformFilterInitialState) {}
        if (state is PlatformFilterLoadingState) {
          List<dynamic> list = [];
          return CustomDropDown(
            pressed: <int>(s) {
              platformFilterBloc.add(FetchOnChangeEvent(id: s));
              gameBloc.add(FetchFilterEvent(
                  search: textEditingController.text, platformId: s));
            },
            itemList: list,
            hintText: "Filter by Platform",
            value: 0,
            isSorting: false,
          );
        }
        if (state is PlatformFilterLoadedState) {
          return CustomDropDown(
            pressed: <int>(s) {
              platformFilterBloc.add(FetchOnChangeEvent(id: s));
              gameBloc.add(FetchFilterEvent(
                  search: textEditingController.text, platformId: s));
            },
            itemList: state.filter!.results!,
            hintText: "Filter by Platform",
            value: 0,
            isSorting: false,
          );
        }
        if (state is PlatformFilterOnChangedState) {
          return Row(
            children: [
              CustomDropDown(
                pressed: <int>(s) {
                  platformFilterBloc.add(FetchOnChangeEvent(id: s));
                  gameBloc.add(FetchFilterEvent(
                      search: textEditingController.text, platformId: s));
                },
                itemList: state.filter!.results!,
                hintText: "Filter by Platform",
                value: state.id!,
                isSorting: false,
              ),
              InkWell(
                  onTap: () {
                    platformFilterBloc.add(const FetchPlatformFilterEvent());
                    gameBloc.add(FetchFilterEvent(
                        search: textEditingController.text, platformId: 0));
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
