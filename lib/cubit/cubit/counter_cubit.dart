import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int _count = 0;
 int getCount() {
    return _count;
  }

  void increaseCount() {
    _count++;
    emit(CounterCountChanged());
  }
}
