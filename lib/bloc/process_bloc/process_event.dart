import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProcessEvent extends Equatable {
  const ProcessEvent();

  @override
  List<Object> get props => [];
}

class LoadedProcess extends ProcessEvent {}
