import 'package:ackaton_manage/models/process/process_model.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CreateProcessEvent extends Equatable {
  const CreateProcessEvent();

  @override
  List<Object> get props => [];
}

class CreateProcessButtonPressed extends CreateProcessEvent {
  final CreateProcessSubmit submitData;

  const CreateProcessButtonPressed({@required this.submitData})
      : assert(submitData != null);

  @override
  List<Object> get props => [submitData];
}
