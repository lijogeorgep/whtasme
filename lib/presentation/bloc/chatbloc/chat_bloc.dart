import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whatsme/data/model/chatroom.dart';
import 'package:whatsme/domain/repositories/repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  @override
  ChatState get initialState => ChatInitial();

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    yield ChatInitial();
    if (event is FetchChatEvent) {
      yield ChatLoadingState();
      try {
        var chatScreen = await Repository().getChatroom();

        yield ChatLoadedState(chatScreen: chatScreen);
      } catch (e) {
        yield ChatErrorState(message: e.toString());
      }
    }
  }
}
