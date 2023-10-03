class UrlBuilder {
  String build({required String articleName,required int numberOfEditors}){
    String url = 'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        '$articleName&rvprop=timestamp|user&rvlimit=$numberOfEditors&redirects';
    return url;

  }
}