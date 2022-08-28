import 'package:equatable/equatable.dart';
import 'package:etiya_case_study/data/models/game_detail.dart';
import 'package:etiya_case_study/data/repositories/game_repository.dart';
import 'package:etiya_case_study/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_detail_event.dart';
part 'game_detail_state.dart';

class GameDetailBloc extends Bloc<GameDetailEvent, GameDetailState> {
  final _gameRepository = locator<GameRepository>();
  GameDetail? _gameDetail;
  GameDetailBloc() : super(GameDetailLoadingState()) {
    on<FetchGameDetailEvent>((event, emit) async {
      try {
        emit(GameDetailLoadingState());
        _gameDetail = await _gameRepository.getGameDetail(event.id);
        emit(GameDetailLoadedState(gameDetail: _gameDetail!));
      } catch (_) {
        emit(GameDetailErrorState());
      }
    });
  }
}
