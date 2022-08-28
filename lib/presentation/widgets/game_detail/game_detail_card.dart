import 'package:etiya_case_study/presentation/widgets/custom_circular_indicator.dart';
import 'package:etiya_case_study/presentation/widgets/game_detail/bloc/game_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameDetailCard extends StatelessWidget {
  const GameDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final gameDetailBloc = BlocProvider.of<GameDetailBloc>(context);

    return BlocBuilder<GameDetailBloc, GameDetailState>(
      bloc: gameDetailBloc,
      builder: (context, state) {
        if (state is GameDetailLoadingState) {
          return Scaffold(
              body: Container(
                  color: const Color.fromRGBO(30, 25, 60, 1),
                  child: const CustomCircularIndicator()));
        }
        if (state is GameDetailLoadedState) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromRGBO(70, 63, 113, 1),
                title: Text(state.gameDetail.name!),
              ),
              body: Container(
                color: const Color.fromRGBO(30, 25, 60, 1),
                height: deviceHeight,
                width: deviceWidth,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      child: Container(
                        height: deviceHeight * 0.3,
                        width: deviceWidth * 1,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            state.gameDetail.backgroundImage!,
                          ),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Text(
                              state.gameDetail.name.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: deviceWidth * 0.2,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(103, 79, 179, 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  state.gameDetail.rating.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.star, color: Colors.green)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: deviceHeight * 0.2,
                        width: deviceWidth * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(70, 63, 113, 0.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Publisher:",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Flexible(
                                  child: Text(
                                    state.gameDetail.publishers![0].name
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Released Date:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  state.gameDetail.released == null
                                      ? "-"
                                      : state.gameDetail.released!.year
                                          .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Updated Date:",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  state.gameDetail.updated == null
                                      ? "-"
                                      : state.gameDetail.updated!.year
                                          .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        }
        if (state is GameDetailErrorState) {
          return const Scaffold(
              body: Center(
            child: Text("Error"),
          ));
        }
        return Container();
      },
    );
  }
}
