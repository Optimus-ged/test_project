import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoadMissionEvent extends Equatable {
  const LoadMissionEvent();

  @override
  List<Object> get props => [];
}

class LoadMissionsLoaded extends LoadMissionEvent {}
