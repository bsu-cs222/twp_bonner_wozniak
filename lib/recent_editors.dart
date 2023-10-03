import 'dart:convert';

class RevisionParser {
  String getMostRecentEditors(String urlData, int limit) {
    final decodedUrl = jsonDecode(urlData);
    final pagesMap = decodedUrl['query']['pages'];
    String editors = getUsersWithinLimit(pagesMap,limit);
    return editors;
  }
  String displayEditorInformation(var username,var timestamp) {
    String organizedInformation = '| Username: $username Date Changed: $timestamp |\n';
    return organizedInformation;
  }
  String getUsersWithinLimit(var pagesMap,int limit) {
    final pagesId = pagesMap.keys.first;
    List<String> recentEditors = [];
    for (int i = 0; i < limit; i++) {
      final username = pagesMap[pagesId]['revisions'][i]['user'];
      final timestamp = pagesMap[pagesId]['revisions'][i]['timestamp'];
      final editorInformation = displayEditorInformation(username, timestamp);
      recentEditors.add(editorInformation);
    }
    final editors = recentEditors.toString();
    return editors;
  }
}