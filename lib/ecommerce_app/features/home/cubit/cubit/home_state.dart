part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class HomeBannerLoading extends HomeState {}
final class HomeBannerSuccess extends HomeState {}
final class HomeBannerError extends HomeState {}


final class HomeItemLoading extends HomeState {}
final class HomeItemSuccess extends HomeState {}
final class HomeItemError extends HomeState {}