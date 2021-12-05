import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CreateTaskEvent extends Equatable {
  const CreateTaskEvent();

  @override
  List<Object> get props => [];
}

class LoadTask extends CreateTaskEvent {}
