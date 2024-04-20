import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tele_flicks/src/common/core/di/di_setup.dart' as di;

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashEvent>((event, emit) {
      switch (event) {
        case SplashAddDependenciesEvent():
          return _addDependencies(event, emit);
      }
    });
  }

  Future<void> _addDependencies(
      SplashAddDependenciesEvent event, Emitter<SplashState> emit) async {
    await di.setup();
    emit(SplashAddedDependenciesState());
  }
}
