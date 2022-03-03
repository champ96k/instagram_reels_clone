import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instagram_reels/core/app_configs/custom_error.dart';
import 'package:instagram_reels/core/model/reel_model.dart';
import 'package:instagram_reels/core/repositories/reels_repository.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  final ReelsRepository repository;
  ReelsCubit({required this.repository}) : super(ReelsInitialState());

  Future<void> fectchReels({required int page}) async {
    try {
      emit(ReelsLoadingState());
      final models = await repository.fetchReels(page: page);
      emit(ReelsLoadedState(models: models));
    } on CustomError catch (e) {
      emit(ReelsErrorState(e.message ?? 'Something went wrong'));
    } catch (e) {
      emit(ReelsErrorState("Error: $e"));
    }
  }
}
