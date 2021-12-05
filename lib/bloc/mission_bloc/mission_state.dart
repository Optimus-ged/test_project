import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoadMissionState extends Equatable {
  const LoadMissionState();

  @override
  List<Object> get props => [];
}

class LoadMissionInitial extends LoadMissionState {}

class LoadMissionInProgress extends LoadMissionState {}

class LoadMissionFailure extends LoadMissionState {
  final String message;

  const LoadMissionFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoadMissionSuccess extends LoadMissionState {
  // final LoadMissionSuccess LoadMission;

  // const LoadMissionSuccess({@required this.LoadMission});

  // @override
  // List<Object> get props => [LoadMission];
}
