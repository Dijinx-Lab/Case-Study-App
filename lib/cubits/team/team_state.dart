part of 'team_cubit.dart';

@immutable
sealed class TeamState {}

final class TeamUninitialized extends TeamState {}

final class TeamInitialized extends TeamState {}

final class TeamError extends TeamState {}