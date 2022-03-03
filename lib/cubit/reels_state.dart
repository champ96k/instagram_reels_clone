part of 'reels_cubit.dart';

abstract class ReelsState extends Equatable {}

class ReelsInitialState extends ReelsState {
  @override
  List<Object?> get props => ['ReelsInitialState'];
}

class ReelsLoadingState extends ReelsInitialState {
  @override
  List<Object?> get props => ['ReelsLoadingState'];
}

class ReelsLoadedState extends ReelsInitialState {
  final List<ReelModel> models;
  ReelsLoadedState({required this.models});

  @override
  List<Object?> get props => [models];
}

class ReelsErrorState extends ReelsState {
  final String errorMessage;
  ReelsErrorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
