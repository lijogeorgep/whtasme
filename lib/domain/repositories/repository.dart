

import 'package:whatsme/data/datasource/provider.dart';
import 'package:whatsme/data/model/chatroom.dart';

class Repository {
  Provider chatScreenProviders =
  Provider();
  Provider statusScreenProviders =
  Provider();
  Provider searchScreenProviders =
  Provider();
  Future<List<Chatroom>> getChatroom({Map<dynamic, dynamic> params}) =>
      chatScreenProviders.getChatroom();

  Future<List<Chatroom>> getStatusroom({Map<dynamic, dynamic> params}) =>
      statusScreenProviders.getStatusroom();
  Future<List<Chatroom>> getSearchroom({Map<dynamic, dynamic> params}) =>
      searchScreenProviders.getSearchroom(params: params);
}
