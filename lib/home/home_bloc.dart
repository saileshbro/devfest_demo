import 'package:bloc/bloc.dart';
import 'package:devfest_demo/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();
  factory HomeBloc() {
    return _homeBlocSingleton;
  }
  HomeBloc._internal();
  @override
  HomeState get initialState => UnHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      yield UnHomeState();
      yield await event.applyAsync();
    } catch (e, stackTrace) {
      print("$e, $stackTrace");
      yield this.state;
    }
  }

  dispose() {
    _homeBlocSingleton.close();
  }
}
