import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'scroll_state_state.dart';

class ScrollStateCubit extends Cubit<ScrollStateState> {
  ScrollStateCubit() : super(ScrollStateUp());

  void scrollDown() => emit(ScrollStateDown());

  void scrollUp() => emit(ScrollStateUp());
}
