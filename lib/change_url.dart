
//import 'dart:convert';
//import 'dart:io';

import 'package:two_week_project/user_input.dart';

class wikiBuilder {
  String NameChanger(String name){ //change to void late
    String url = 'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        '${name}';
    //String url = 'http//:${name}.com';
    return url;
  }
  String LimitChanger(String limit){
    String url2= '&rvprop=timestamp|user&rvlimit=${limit}&redirects';
    return url2;
  }
  String Builder(String firstHalf,String secondHalf){
    String complete = '${firstHalf}${secondHalf}';
    return complete;
  }
}