import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateTaskState extends Equatable {
  const CreateTaskState();

  @override
  List<Object> get props => [];
}

class CreateTaskInitial extends CreateTaskState {}

class CreateTaskInProgress extends CreateTaskState {}

class CreateTaskFailure extends CreateTaskState {
  final String message;

  const CreateTaskFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class CreateTaskSuccess extends CreateTaskState {
  // final MissionsResponse missions;

  // const CreateTaskSuccess({@required this.CreateTask});

  // @override
  // List<Object> get props => [CreateTask];
}
