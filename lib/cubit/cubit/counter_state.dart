part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

final class CounterInitial extends CounterState {}
final class CounterCountChanged extends CounterState {}
