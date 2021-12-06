import 'package:ackaton_manage/models/mission/mission_response.dart';
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
  final MissionResponse missions;

  const LoadMissionSuccess({@required this.missions});

  @override
  List<Object> get props => [missions];
}
