import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whatsme/data/model/chatroom.dart';
import 'package:whatsme/domain/repositories/repository.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  @override
  StatusState get initialState => StatusInitial();

  @override
  Stream<StatusState> mapEventToState(
    StatusEvent event,
  ) async* {
    yield StatusInitial();
    if (event is FetchStatusEvent) {
      yield StatusLoadingState();
      try {
        var statusScreen = await Repository().getStatusroom();

        yield StatusLoadedState(statusScreen: statusScreen);
      } catch (e) {
        yield StatusErrorState(message: e.toString());
      }
    }
  }
}
