import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_week_project/fetch_data.dart';
import 'package:two_week_project/revision_parser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Wikipedia Search',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: MyHomePage(),
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var currentArticle = '';
  var revisedUrl='';
  void registerUserArticleCommand({userArticleInput}) async {
    currentArticle = userArticleInput;
    notifyListeners();
  }
}

class MasterWizard {
  Future<String> getMostRecentUser(String currentArticle) async {
    UrlBuilder urlBuilder= UrlBuilder();
    DataFetcher dataFetcher = DataFetcher();
    RevisionParser revisionParser= RevisionParser();
    String revisedUrl=urlBuilder.getInformationFromUser(article: currentArticle, limit: '4');
    print(revisedUrl);
    var urlData= await dataFetcher.getDataFromInternet(revisedUrl);
    var username=revisionParser.getTheMostRecentEditor(urlData);
    return username;
}
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputBar = TextEditingController();

  Future<String>? future;

  @override
  Widget build(BuildContext context){
    if (future==null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10, width: 10),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Enter the name of the article you want to look up.'),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: TextField(
              controller: inputBar,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: search, child: const Text('Enter'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: SizedBox(
                height: 125,
                width: 700,
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text('idk man this is where the info is gonna go'))),
          ),
        ],
      );
    }
  }
  void search() async {
    var appState = context.watch<MyAppState>();
    MasterWizard masterWizard= MasterWizard();
    setState(() {
      String current = inputBar.text;
      appState.registerUserArticleCommand(userArticleInput: current);
      future = Future.delayed(const Duration(seconds: 7), () => masterWizard.getMostRecentUser(current));
      inputBar.clear();
      print (future);
    });
  }
}






//String current = inputBar.text;
//appState.registerUserArticleCommand(userArticleInput: current);
//print(current);
//inputBar.clear();