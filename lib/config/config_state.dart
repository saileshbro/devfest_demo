import 'package:equatable/equatable.dart';

abstract class ConfigState extends Equatable {
  const ConfigState();
  List<Object> get props => [];

  ConfigState getStateCopy();
}

class UnConfigState extends ConfigState {
  @override
  ConfigState getStateCopy() {
    return UnConfigState();
  }

  @override
  String toString() => "UnConfigState";
}

class InConfigState extends ConfigState {
  @override
  ConfigState getStateCopy() {
    return InConfigState();
  }

  @override
  String toString() => "InConfigState";
}

class ErrorConfigState extends ConfigState {
  final String errorMessage;

  ErrorConfigState(this.errorMessage);
  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMessage);
  }

  @override
  String toString() => "ErrorConfigState";
}
