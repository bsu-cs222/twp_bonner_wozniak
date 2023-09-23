class WikiBuilder {
  String nameChanger(String name){
    String url = 'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        '$name';
    return url;
  }
  String limitChanger(String limit){
    String url2= '&rvprop=timestamp|user&rvlimit=$limit&redirects';
    return url2;
  }
  String builder(String firstHalf,String secondHalf){
    String complete = '$firstHalf$secondHalf';
    return complete;
  }
}