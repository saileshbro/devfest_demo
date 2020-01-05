import 'package:devfest_demo/utils/devfest.dart';
import 'package:equatable/equatable.dart';
import 'index.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();
  @override
  List<Object> get props => [];
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn;
  DarkModeEvent(this.darkOn);

  @override
  String toString() {
    return "DarkModeEvent";
  }

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      bloc.darkModeOn = this.darkOn;
      Devfest.prefs.setBool(Devfest.darkModePref, darkOn);
      return InConfigState();
    } catch (e, stackTrace) {
      print("$e , $stackTrace");
      return ErrorConfigState(e?.toString());
    }
  }
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() {
    return "LoadConfigEvent";
  }

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    } catch (e, stackTrace) {
      print("$e , $stackTrace");
      return ErrorConfigState(e?.toString());
    }
  }
}
