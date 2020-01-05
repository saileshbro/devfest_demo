import 'package:bloc/bloc.dart';

import 'index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();
  factory ConfigBloc() {
    return _configBlocSingleton;
  }
  ConfigBloc._internal();
  bool darkModeOn = false;
  @override
  ConfigState get initialState => UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    try {
      yield UnConfigState();
      yield await event.applyAsync(currentState: this.state, bloc: this);
    } catch (e, stackTrace) {
      print("$e, $stackTrace");
      yield this.state;
    }
  }

  dispose() {
    _configBlocSingleton.close();
  }
}
