import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateParticipantState extends Equatable {
  const CreateParticipantState();

  @override
  List<Object> get props => [];
}

class CreateParticipantInitial extends CreateParticipantState {}

class CreateParticipantInProgress extends CreateParticipantState {}

class CreateParticipantFailure extends CreateParticipantState {
  final String message;

  const CreateParticipantFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class CreateParticipantSuccess extends CreateParticipantState {
  // final MissionsResponse missions;

  // const CreateParticipantSuccess({@required this.CreateParticipant});

  // @override
  // List<Object> get props => [CreateParticipant];
}
