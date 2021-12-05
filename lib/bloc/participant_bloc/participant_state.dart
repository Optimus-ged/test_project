import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoadParticipantState extends Equatable {
  const LoadParticipantState();

  @override
  List<Object> get props => [];
}

class LoadParticipantInitial extends LoadParticipantState {}

class LoadParticipantInProgress extends LoadParticipantState {}

class LoadParticipantFailure extends LoadParticipantState {
  final String message;

  const LoadParticipantFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoadParticipantSuccess extends LoadParticipantState {
  // final MissionsResponse missions;

  // const LoadParticipantSuccess({@required this.LoadParticipant});

  // @override
  // List<Object> get props => [LoadParticipant];
}
