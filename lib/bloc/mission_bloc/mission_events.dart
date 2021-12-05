import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MissionEvent extends Equatable {
  const MissionEvent();

  @override
  List<Object> get props => [];
}

class MissionsLoaded extends MissionEvent {}
