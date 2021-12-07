import 'package:ackaton_manage/models/process/process_response.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CreateProcessState extends Equatable {
  const CreateProcessState();

  @override
  List<Object> get props => [];
}

class CreateProcessInitial extends CreateProcessState {}

class CreateProcessInProgress extends CreateProcessState {}

class CreateProcessFailure extends CreateProcessState {
  final String message;

  const CreateProcessFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class CreateProcessSuccess extends CreateProcessState {
  final CreateProcessResponse processData;

  const CreateProcessSuccess({@required this.processData});

  @override
  List<Object> get props => [processData];
}
