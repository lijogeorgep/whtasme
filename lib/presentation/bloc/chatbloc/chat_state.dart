part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}
class ChatLoadingState extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoadedState extends ChatState {
  final List<Chatroom> chatScreen;

  ChatLoadedState({this.chatScreen});

  @override
  List<Object> get props => [];
}

class ChatErrorState extends ChatState {
  String message;

  ChatErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}