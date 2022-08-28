part of 'platform_filter_bloc.dart';

abstract class PlatformFilterState extends Equatable {
  const PlatformFilterState();

  @override
  List<Object> get props => [];
}

class PlatformFilterInitialState extends PlatformFilterState {
  const PlatformFilterInitialState();
}

class PlatformFilterLoadingState extends PlatformFilterState {
  const PlatformFilterLoadingState();
}

class PlatformFilterLoadedState extends PlatformFilterState {
  final Filter? filter;
  const PlatformFilterLoadedState({this.filter});
}

class PlatformFilterOnChangedState extends PlatformFilterState {
  final int? id;
  final Filter? filter;
  const PlatformFilterOnChangedState({this.id, this.filter});
}

class PlatformFilterError extends PlatformFilterState {
  const PlatformFilterError();
}
