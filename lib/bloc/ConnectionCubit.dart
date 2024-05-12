import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionCubit extends Cubit<bool> {

  // The subscription provides events to the listener, and holds
  // the callbacks used to handle the events
  StreamSubscription<ConnectivityResult>? subscription;

  //Connection status check result.
  ConnectivityResult? connectivityResult;

  ConnectionCubit() : super(false) {
    checkConnection();
  }

  Future<void> checkConnection() async {
    StreamSubscription<List<ConnectivityResult>> subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      bool resu = !(result.contains(ConnectivityResult.none));
      emit(resu);
      print(resu);
    });
  }

}
