import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateParticipantEvent extends Equatable {
  const CreateParticipantEvent();

  @override
  List<Object> get props => [];
}

class LoadParticipant extends CreateParticipantEvent {}
