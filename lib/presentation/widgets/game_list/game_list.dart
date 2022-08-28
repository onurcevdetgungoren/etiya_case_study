import 'package:auto_route/auto_route.dart';
import 'package:etiya_case_study/presentation/widgets/custom_circular_indicator.dart';
import 'package:etiya_case_study/presentation/widgets/game_detail/bloc/game_detail_bloc.dart';
import 'package:etiya_case_study/presentation/widgets/game_list/bloc/game_bloc.dart';
import 'package:etiya_case_study/presentation/widgets/game_list/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameList extends StatelessWidget {
  final ScrollController scrollController;
  const GameList({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameBloc = BlocProvider.of<GameBloc>(context);
    final gameDetailBloc = BlocProvider.of<GameDetailBloc>(context);
    return BlocBuilder<GameBloc, GameState>(
      bloc: gameBloc,
      builder: (context, state) {
        if (state is GameInitialState) {}
        if (state is GameLoadingState) {
          return const CustomCircularIndicator();
        }
        if (state is GameLoadedState) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: state.hasMore == true
                      ? state.gameList.length + 1
                      : state.gameList.length,
                  itemBuilder: (context, index) {
                    if (state.hasMore == true &&
                        state.gameList.length == index) {
                      return _newGamesLoadingIndicator();
                    } else {
                      return InkWell(
                        onTap: () {
                          gameDetailBloc.add(FetchGameDetailEvent(
                              id: state.gameList[index].id.toString()));
                          context.router.pushNamed('/game-detail-page');
                        },
                        child: GameCard(
                            name: state.gameList[index].name ??
                                "No Name Available",
                            rating: state.gameList[index].rating == null
                                ? "0.0"
                                : state.gameList[index].rating.toString(),
                            poster: state.gameList[index].backgroundImage),
                      );
                    }
                  }),
            ),
          );
        }
        if (state is GamePaginationState) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: state.hasMore == true
                      ? state.gameList.length + 1
                      : state.gameList.length,
                  itemBuilder: (context, index) {
                    if (state.hasMore == true &&
                        state.gameList.length == index) {
                      return _newGamesLoadingIndicator();
                    } else {
                      return InkWell(
                        onTap: () {
                          gameDetailBloc.add(FetchGameDetailEvent(
                              id: state.gameList[index].id.toString()));
                          context.router.pushNamed('/game-detail-page');
                        },
                        child: GameCard(
                            name: state.gameList[index].name ??
                                "No Name Available",
                            rating: state.gameList[index].rating == null
                                ? "0.0"
                                : state.gameList[index].rating.toString(),
                            poster: state.gameList[index].backgroundImage),
                      );
                    }
                  }),
            ),
          );
        }
        return Container();
      },
    );
  }

  _newGamesLoadingIndicator() {
    return const Padding(
        padding: EdgeInsets.all(8), child: CustomCircularIndicator());
  }
}
