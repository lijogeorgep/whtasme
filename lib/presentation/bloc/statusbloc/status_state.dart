part of 'status_bloc.dart';

abstract class StatusState extends Equatable {
  const StatusState();
}

class StatusInitial extends StatusState {
  @override
  List<Object> get props => [];
}
class StatusLoadingState extends StatusState {
  @override
  List<Object> get props => [];
}

class StatusLoadedState extends StatusState {
  final List<Chatroom> statusScreen;

  StatusLoadedState({this.statusScreen});

  @override
  List<Object> get props => [];
}

class StatusErrorState extends StatusState {
  String message;

  StatusErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}