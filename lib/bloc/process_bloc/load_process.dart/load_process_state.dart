import 'package:ackaton_manage/models/process/load_process_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoadProcessState extends Equatable {
  const LoadProcessState();

  @override
  List<Object> get props => [];
}

class LoadProcessInitial extends LoadProcessState {}

class LoadProcessInProgress extends LoadProcessState {}

class LoadProcessFailure extends LoadProcessState {
  final String message;

  const LoadProcessFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class LoadProcessSuccess extends LoadProcessState {
  final LoadProcessResponse procResp;

  const LoadProcessSuccess({@required this.procResp});

  @override
  List<Object> get props => [procResp];
}
