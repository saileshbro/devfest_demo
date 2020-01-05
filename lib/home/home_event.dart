import 'package:devfest_demo/home/index.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
  Future<HomeState> applyAsync({HomeState state, HomeBloc bloc});
}

class LoadHomeEvent extends HomeEvent {
  @override
  String toString() => "LoadHomeEvent";

  @override
  Future<HomeState> applyAsync({HomeState state, HomeBloc bloc}) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      return InHomeState();
    } catch (e, stackTrace) {
      print('$e $stackTrace');
      return ErrorHomeState(e?.toString());
    }
  }
}
