import 'package:equatable/equatable.dart';
import 'package:etiya_case_study/data/models/filter.dart';
import 'package:etiya_case_study/data/repositories/filter_repository.dart';
import 'package:etiya_case_study/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'platform_filter_event.dart';
part 'platform_filter_state.dart';

class PlatformFilterBloc
    extends Bloc<PlatformFilterEvent, PlatformFilterState> {
  final _filterRepository = locator<FilterRepository>();
  Filter? _filter;
  PlatformFilterBloc() : super(const PlatformFilterInitialState()) {
    //get platforms
    on<FetchPlatformFilterEvent>((event, emit) async {
      try {
        emit(const PlatformFilterLoadingState());
        _filter = await _filterRepository.getPlatformFilters();
        emit(PlatformFilterLoadedState(filter: _filter));
      } catch (_) {
        emit(const PlatformFilterError());
      }
    });

    //change dropdownmenu
    on<FetchOnChangeEvent>((event, emit) async {
      emit(PlatformFilterLoadedState(filter: _filter));
      emit(PlatformFilterOnChangedState(id: event.id, filter: _filter));
    });
  }
}
