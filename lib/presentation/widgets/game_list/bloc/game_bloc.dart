import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:etiya_case_study/data/models/game.dart';
import 'package:etiya_case_study/data/repositories/game_repository.dart';
import 'package:etiya_case_study/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final _gameRepository = locator<GameRepository>();
  int _page = 0;
  final int _pageSize = 10;
  bool _hasMore = false;
  List<Result> _gameList = [];
  Game? _game;
  int _totalPage = 0;
  int _platformId = 0;
  String _orderingItem = "";
  bool get hasMore => _hasMore;
  GameBloc() : super(const GameInitialState()) {
    //search event
    on<FetchGameEvent>((event, emit) async {
      try {
        if (event.search.length >= 3) {
          emit(const GameLoadingState());
          _page = 0;
          _page++;
          _game = await _gameRepository.getGames(_page.toString(), event.search,
              _pageSize.toString(), _platformId, _orderingItem);
          _gameList = [];
          _hasMore = false;
          _gameList.addAll(_game!.results!);
          log(_gameList.length.toString());
          _totalPage = (_game!.count! / 10).ceil();
          if (_totalPage > _page) {
            _hasMore = true;
          } else {
            _hasMore = false;
          }
          emit(GameLoadedState(
            game: _game,
            hasMore: _hasMore,
            gameList: _gameList,
          ));
        }
      } catch (_) {
        emit(GameErrorState());
      }
    });

    //pagination event
    on<FetchPaginationEvent>((event, emit) async {
      try {
        emit(GameLoadedState(
          game: _game,
          hasMore: _hasMore,
          gameList: _gameList,
        ));
        _page++;
        _game = await _gameRepository.getGames(_page.toString(), event.search,
            _pageSize.toString(), _platformId, _orderingItem);
        _gameList.addAll(_game!.results!);
        log(_gameList.length.toString());
        _totalPage = (_game!.count! / 10).ceil();
        if (_totalPage > _page) {
          _hasMore = true;
        } else {
          _hasMore = false;
        }

        emit(GamePaginationState(
          game: _game,
          hasMore: _hasMore,
          gameList: _gameList,
        ));
      } catch (_) {
        emit(GameErrorState());
      }
    });

    //filter event
    on<FetchFilterEvent>((event, emit) async {
      try {
        emit(const GameLoadingState());
        _page = 0;
        _page++;
        _platformId = event.platformId;
        _game = await _gameRepository.getGames(_page.toString(), event.search,
            _pageSize.toString(), _platformId, _orderingItem);
        _gameList = [];
        _hasMore = false;
        _gameList.addAll(_game!.results!);
        log(_gameList.length.toString());
        _totalPage = (_game!.count! / 10).ceil();
        if (_totalPage > _page) {
          _hasMore = true;
        } else {
          _hasMore = false;
        }

        emit(GameLoadedState(
          game: _game,
          hasMore: _hasMore,
          gameList: _gameList,
        ));
      } catch (_) {
        emit(GameErrorState());
      }
    });

    //ordering event
    on<FetchSortingEvent>((event, emit) async {
      try {
        emit(const GameLoadingState());
        _page = 0;
        _page++;
        _orderingItem = event.orderingItem;
        _game = await _gameRepository.getGames(_page.toString(), event.search,
            _pageSize.toString(), _platformId, _orderingItem);
        _gameList = [];
        _hasMore = false;
        _gameList.addAll(_game!.results!);
        log(_gameList.length.toString());
        _totalPage = (_game!.count! / 10).ceil();
        if (_totalPage > _page) {
          _hasMore = true;
        } else {
          _hasMore = false;
        }

        emit(GameLoadedState(
          game: _game,
          hasMore: _hasMore,
          gameList: _gameList,
        ));
      } catch (_) {
        emit(GameErrorState());
      }
    });
  }
}
