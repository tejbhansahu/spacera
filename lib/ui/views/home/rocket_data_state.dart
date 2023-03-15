part of '../../../core/repositories/rocket_repository/rocket_repository_impl.dart';

@immutable
abstract class RocketDataState {}

class RocketDataLoading extends RocketDataState {}

class RocketDataError extends RocketDataState {}

class RocketDataSuccess extends RocketDataState {
  final List<RocketsResponse> rocketList;

  RocketDataSuccess({required this.rocketList});
}
