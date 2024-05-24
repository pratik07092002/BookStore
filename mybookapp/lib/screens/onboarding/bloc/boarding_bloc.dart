import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'boarding_event.dart';
part 'boarding_state.dart';

class BoardingBloc extends Bloc<BoardingEvent, BoardingState> {
  BoardingBloc() : super(BoardingState()) {
    on<SkipButtonClickEvent>((event, emit) {
     emit(LoginState());
    });
  }
}
