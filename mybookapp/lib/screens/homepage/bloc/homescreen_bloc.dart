import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomeScreenState> {
  HomescreenBloc() : super(HomeScreenState()) {
    on<ItemButtonclickEvent>(_nextpage);
  }

  void _nextpage(ItemButtonclickEvent event, Emitter<HomeScreenState> emit) {
    emit(ItemShowState());
  }
}
