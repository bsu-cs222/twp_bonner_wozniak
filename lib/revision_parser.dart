import 'dart:convert';
class RevisionParser{
  String getTheMostRecentEditor(String urlData){
    final decoded = jsonDecode(urlData);
    final pagesMap = decoded['query']['pages'];
    final pagesId = pagesMap.keys.first;
    final username = pagesMap[pagesId]['revisions'][0]['user'];
    return username;
  }
}