import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:whatsme/data/model/chatroom.dart';
import 'package:whatsme/domain/repositories/repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => SearchInitial();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    yield SearchInitial();
    if (event is FetchSearchEvent) {
      yield SearchLoadingState();
      try {
        var searchScreen = await Repository().getSearchroom(params: event.paramsearch);

        yield SearchLoadedState(searchScreen: searchScreen);
      } catch (e) {
        yield SearchErrorState(message: e.toString());
      }
    }
  }
}
