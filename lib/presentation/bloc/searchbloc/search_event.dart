part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class FetchSearchEvent extends SearchEvent {
  final Map paramsearch;
  FetchSearchEvent({this.paramsearch});
  @override
  // TODO: implement props
  List<Object> get props => null;
}