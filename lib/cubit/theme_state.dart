import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ThemeState extends Equatable {}

class ThemeLightState extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeDarkState extends ThemeState {
  @override
  List<Object> get props => [];
}
