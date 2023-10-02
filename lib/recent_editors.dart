import 'dart:convert';

import 'package:two_week_project/fetch_data.dart';
class RevisionParser {
  String getMostRecentEditors(String urlData,int limit) {
    print (urlData);
    final decoded = jsonDecode(urlData);
    final pagesMap = decoded['query']['pages'];
    final pagesId = pagesMap.keys.first;
    List<String> recentUsers = [];
    for(int i=0;i<limit;i++){
      final username = pagesMap[pagesId]['revisions'][i]['user'];
      final timestamp = pagesMap[pagesId]['revisions'][i]['timestamp'];
      final userInfo = displayUserInformation(username, timestamp);
      recentUsers.add(userInfo);
    }
    String users = recentUsers.toString();
    return users;
  }

  String displayUserInformation(var username, var timestamp) {
    String organizedInfo = 'Username: $username Timestamp: $timestamp\n';
    return organizedInfo;
  }
}
