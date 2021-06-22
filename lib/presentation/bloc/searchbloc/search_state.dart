part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}
class SearchLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoadedState extends SearchState {
  final List<Chatroom> searchScreen;

  SearchLoadedState({this.searchScreen});

  @override
  List<Object> get props => [];
}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}