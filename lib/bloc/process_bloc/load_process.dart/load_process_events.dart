import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoadProcessEvent extends Equatable {
  const LoadProcessEvent();

  @override
  List<Object> get props => [];
}

class LoadProcesssLoaded extends LoadProcessEvent {}
