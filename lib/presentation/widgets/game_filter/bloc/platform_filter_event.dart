part of 'platform_filter_bloc.dart';

abstract class PlatformFilterEvent extends Equatable {
  const PlatformFilterEvent();

  @override
  List<Object> get props => [];
}

class FetchPlatformFilterEvent extends PlatformFilterEvent {
  const FetchPlatformFilterEvent();
}

class FetchOnChangeEvent extends PlatformFilterEvent {
  final int id;
  const FetchOnChangeEvent({required this.id});
}
