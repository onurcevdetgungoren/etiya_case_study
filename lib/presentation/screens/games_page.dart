import 'dart:developer';
import 'package:etiya_case_study/presentation/widgets/game_filter/filter_dropdown.dart';
import 'package:etiya_case_study/presentation/widgets/game_list/bloc/game_bloc.dart';
import 'package:etiya_case_study/presentation/widgets/game_list/game_list.dart';
import 'package:etiya_case_study/presentation/widgets/game_list/search_bar.dart';
import 'package:etiya_case_study/presentation/widgets/game_sorting/sorting_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_addListenerToScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(70, 63, 113, 1),
          centerTitle: true,
          title: const Text("Game Box"),
        ),
        body: Container(
          color: const Color.fromRGBO(30, 25, 60, 1),
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              children: [
                SearchBar(textEditingController: _textController),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                    width: deviceWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterDropdown(textEditingController: _textController),
                        SortingDropdown(textController: _textController),
                      ],
                    ),
                  ),
                ),
                GameList(scrollController: _scrollController),
              ],
            ),
          ),
        ));
  }

  void _addListenerToScroll() {
    final gameBloc = BlocProvider.of<GameBloc>(context);
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (gameBloc.hasMore == true) {
        gameBloc.add(FetchPaginationEvent(
          search: _textController.text,
        ));
      } else {
        log("finished");
      }
    }
  }
}
