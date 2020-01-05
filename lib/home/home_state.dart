import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  HomeState getStateCopy();
  @override
  List<Object> get props => [];
}

class UnHomeState extends HomeState {
  @override
  String toString() => "UnHomeState";

  @override
  HomeState getStateCopy() {
    return UnHomeState();
  }
}

class InHomeState extends HomeState {
  @override
  HomeState getStateCopy() {
    return InHomeState();
  }

  @override
  String toString() => "InHomeState";
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);
  @override
  HomeState getStateCopy() {
    return ErrorHomeState(this.errorMessage);
  }

  @override
  String toString() => "ErrorHomeState";
}
