class UrlBuilder {
  String build({required String name,required int limit}){
    String url = 'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        '$name&rvprop=timestamp|user&rvlimit=$limit&redirects';
    return url;

  }
}