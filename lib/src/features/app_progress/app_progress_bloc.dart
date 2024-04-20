import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProgressBloc extends Bloc<AppProgressEvent, AppProgressState> {
  AppProgressBloc() : super(AppProgressState()) {
    on<AppProgressChangeProgressEvent>(
        (event, emit) => _changeProgress(event, emit));
  }

  _changeProgress(
      AppProgressChangeProgressEvent event, Emitter<AppProgressState> emit) {
    emit(AppProgressState(inProgress: event.inProgress));
  }
}

// abstract class ProgressState {
//   bool get inProgress;
// }

abstract class AppProgressEvent {}

class AppProgressChangeProgressEvent extends AppProgressEvent {
  final bool inProgress;

  AppProgressChangeProgressEvent(this.inProgress);
}

class AppProgressState extends Equatable {
  final bool inProgress;
  AppProgressState({
    this.inProgress = false,
  });

  @override
  List<Object> get props => [inProgress];

  AppProgressState copyWith({
    bool? inProgress,
  }) {
    return AppProgressState(inProgress: inProgress ?? this.inProgress);
  }
}

