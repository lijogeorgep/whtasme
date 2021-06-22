
import 'package:whatsme/config/serveraddress.dart';
import 'package:whatsme/data/model/chatroom.dart';
import 'package:whatsme/domain/entities/RestApi.dart';
import 'package:whatsme/domain/entities/app_exceptions.dart';

class Provider {
  /// Employee list
  Future<List<Chatroom>> getChatroom({Map<dynamic, dynamic> params}) async {
    print("params+$params");
    try {
      var res = await RestAPI()
          .get(ServerAddresses.chatList);

      return chatroomFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }

  Future<List<Chatroom>> getStatusroom({Map<dynamic, dynamic> params}) async {
    print("params+$params");
    try {
      var res = await RestAPI()
          .get(ServerAddresses.statusList);

      return chatroomFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }
  Future<List<Chatroom>> getSearchroom({Map<dynamic, dynamic> params}) async {
    print("params+$params");
    try {
      var res = await RestAPI()
          .get(ServerAddresses.searchList);

      return chatroomFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }



}