import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetParticipantEvent extends Equatable {
  const GetParticipantEvent();

  @override
  List<Object> get props => [];
}

class LoadParticipant extends GetParticipantEvent {}
